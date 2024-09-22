;; Install and configure projectile
(use-package projectile
	:ensure t
	:init (projectile-mode +1)
	:bind (:map projectile-mode-map
							("C-c p" . projectile-command-map)))

;; Function to load proiect init files
(defun my-load-project-inits ()
	"Load .emacs-project(-user).el if existing when entering a project"
	(message (concat "Loading project: " (projectile-project-root)))
	(dolist (init-file (list
											".emacs-project.el"
											".emacs-project-user.el"))
		(let ((file (expand-file-name
								 init-file (projectile-project-root))))
			(if (file-exists-p file) (load-file file)))))

;; Load project init files after a short delay to make sure project root is available
(defun my-delayed-project-inits ()
	(run-with-timer 1 nil 'my-load-project-inits))
(add-hook 'desktop-after-read-hook 'my-delayed-project-inits)

;; Load project init files every time the project is switched to
(add-hook 'projectile-after-switch-project-hook #'my-load-project-inits)
