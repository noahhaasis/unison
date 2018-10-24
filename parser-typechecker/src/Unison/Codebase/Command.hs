module Unison.Codebase.Command where

import           Unison.Codebase.Branch (Branch)
import           Unison.Codebase.Name   (Name)
import           Unison.DataDeclaration (DataDeclaration, EffectDeclaration)
import           Unison.Reference       (Reference)
import           Unison.Term            (AnnotatedTerm)
import           Unison.Type            (AnnotatedType)

data Command branchId
  = AddBranch { branchName :: Name }
  | DeleteBranch { branchName :: Name }
  | RestoreBranch { branchName :: Name, branch :: Branch, branchId :: branchId }
  | SwitchBranch { branchName :: Name }
  | ListBranches
  -- requires an active branch
  | AddCode { terms   :: [(Name, Reference)]
            , datas   :: [(Name, Reference)]
            , effects :: [(Name, Reference)]
            , branchId :: branchId
            }
  | ListCode         { prefix :: Name, branchId :: branchId }
  | RemoveTerm       { name :: Name, oldReference :: Reference, branchId :: branchId }
  | RemoveDataDecl   { name :: Name, oldReference :: Reference, branchId :: branchId }
  | RemoveEffectDecl { name :: Name, oldReference :: Reference, branchId :: branchId }
  | RestoreTerm      { name :: Name, oldReference :: Reference, branchId :: branchId }
  | RestoreDataDecl  { name :: Name, oldReference :: Reference, branchId :: branchId }
  | RestoreEffectDecl{ name :: Name, oldReference :: Reference, branchId :: branchId }
  | ReplaceTerm      { oldReference :: Reference, newReference :: Reference, branchId :: branchId }
  | ReplaceDataDecl  { oldReference :: Reference, newReference :: Reference, branchId :: branchId }
  | ReplaceEffectDecl{ oldReference :: Reference, newReference :: Reference, branchId :: branchId }
  | RenameTerm       { oldName :: Name, newName :: Name, reference :: Reference, branchId :: branchId }
  | RenameDataDecl   { oldName :: Name, newName :: Name, reference :: Reference, branchId :: branchId }
  | RenameEffectDecl { oldName :: Name, newName :: Name, reference :: Reference, branchId :: branchId }

-- addBranch :: BranchOps -> Name -> (Command, Command)
-- addBranch
