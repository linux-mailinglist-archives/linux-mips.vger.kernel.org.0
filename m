Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18CFF1C2466
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 11:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgEBJvi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 05:51:38 -0400
Received: from elvis.franken.de ([193.175.24.41]:36554 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726548AbgEBJvi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 2 May 2020 05:51:38 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jUoo0-0007w3-00; Sat, 02 May 2020 11:51:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6A89CC0360; Sat,  2 May 2020 11:50:51 +0200 (CEST)
Date:   Sat, 2 May 2020 11:50:51 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] MIPS: tools: Show result for loongson3-llsc-check
Message-ID: <20200502095051.GA3576@alpha.franken.de>
References: <1588391701-5588-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588391701-5588-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 02, 2020 at 11:55:01AM +0800, Tiezhu Yang wrote:
> It is better to show the result before loongson3-llsc-check exit,
> otherwise we can see nothing if the return status is EXIT_SUCCESS,
> it seems confusing.
> 
> E.g. without this patch:
> 
> [loongson@localhost tools]$ ./loongson3-llsc-check ../../../vmlinux
> [loongson@localhost tools]$
> 
> With this patch:
> 
> [loongson@localhost tools]$ ./loongson3-llsc-check ../../../vmlinux
> loongson3-llsc-check returns success
> [loongson@localhost tools]$
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> 
> v2:
>   - move "returns" after "loongson3-llsc-check" suggested by Sergei
> 
>  arch/mips/tools/loongson3-llsc-check.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/tools/loongson3-llsc-check.c b/arch/mips/tools/loongson3-llsc-check.c
> index 0ebddd0..bdbc7b4 100644
> --- a/arch/mips/tools/loongson3-llsc-check.c
> +++ b/arch/mips/tools/loongson3-llsc-check.c
> @@ -303,5 +303,7 @@ int main(int argc, char *argv[])
>  out_close:
>  	close(vmlinux_fd);
>  out_ret:
> +	fprintf(stdout, "loongson3-llsc-check returns %s\n",
> +		status ? "failure" : "success");
>  	return status;
>  }
> -- 
> 2.1.0

I've applied your first version, please rebase to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
