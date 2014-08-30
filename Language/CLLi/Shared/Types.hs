import qualified Data.Bytestring.Char8 as C

data Statement = DefineFunction C.ByteString [C.ByteString] |
                 DefineTest C.ByteString [C.ByteString] |
                 BlockBegin Integer |
                 BlockEnd Integer |
                 CellAssign Expression |
                 OutputAssign Expression |
                 LoopExplicit Expression Integer |
                 LoopBounded Expression Integer |
                 LoopMu Integer |
                 If TestExpression Statement |
                 Quit Integer | -- 'QUIT' behaves like 'continue' in C
                 Abort Integer  -- 'ABORT' behaves like 'break' in C
                 deriving (Eq, Show)

data Expression = Natural Integer |
                  Boolean Bool |
                  CellAccess Expression |
                  Plus Expression Expression |
                  Times Expression Expression |
                  ProcedureCall C.ByteString [Expression]
                  deriving (Eq, Show)
