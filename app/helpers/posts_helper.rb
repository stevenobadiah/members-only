module PostsHelper
    def posts_params
        params.require(:post).permit(:body)
    end
end