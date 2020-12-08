Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDDC2D314A
	for <lists+linux-mips@lfdr.de>; Tue,  8 Dec 2020 18:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgLHRks (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Dec 2020 12:40:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbgLHRks (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Dec 2020 12:40:48 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1C8C061749;
        Tue,  8 Dec 2020 09:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=q3JeTKLFW0EdGpRJyKyhaqWYRodE6Jh+oAw4vjKpMxU=; b=Be3ISITwqlZMgyLZqQrzo40d20
        fHxzeba1EXi7BJADcE6pU6WltX59VJV6fZgsXrKanD8AyMwPlq1gj3mySHlnp0mE44QouTkWVE6Cn
        e/oI2jQcMjgvgssMZpCg/Cteg5aHVcO7ljvvL+W8P2VWWFqcLK6fU1QoFx8E6QIrssREE88lZatQ/
        G9xWmhU00P68Qwb80SJk3J08xYuALEPqoUYvX1PzUWt72bksVKExzcvdVLrAgUjqJATyKMDedXs3r
        sQXyAYJKC9EwLSNFCWup8QXjr5KE/Q6UjQamM+qotTnsegSdtwKf1AQRIfQ77kMNxxtc7vvkui72n
        NuQP13DQ==;
Received: from [2601:1c0:6280:3f0::1494]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kmgy2-0005Ma-OW; Tue, 08 Dec 2020 17:40:03 +0000
Subject: Re: [PATCH 1/2] if_enabled.h: Add IF_ENABLED_OR_ELSE() and
 IF_ENABLED() macros
To:     Paul Cercueil <paul@crapouillou.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, od@zcrc.me,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201208164821.2686082-1-paul@crapouillou.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cf2f222b-e7cc-c7b7-2586-31dd3df7c0c7@infradead.org>
Date:   Tue, 8 Dec 2020 09:39:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208164821.2686082-1-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/8/20 8:48 AM, Paul Cercueil wrote:
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Hi Paul,

Why not just add these 2 new macros to <linux/kconfig.h> ?

Maybe you don't want to add the other 2 headers there also?

> ---
>  include/linux/if_enabled.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 include/linux/if_enabled.h
> 
> diff --git a/include/linux/if_enabled.h b/include/linux/if_enabled.h
> new file mode 100644
> index 000000000000..8189d1402340
> --- /dev/null
> +++ b/include/linux/if_enabled.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_IF_ENABLED_H
> +#define __LINUX_IF_ENABLED_H
> +
> +#include <linux/build_bug.h>
> +#include <linux/compiler_types.h>
> +#include <linux/kconfig.h>
> +
> +/*
> + * IF_ENABLED_OR_ELSE(CONFIG_FOO, a, b) evaluates to (a) if CONFIG_FOO is set
> + * to 'y' or 'm', (b) otherwise.
> + */
> +#define IF_ENABLED_OR_ELSE(option, a, b) \
> +	(BUILD_BUG_ON_ZERO(__same_type((a), (b))) || IS_ENABLED(option) ? (a) : (b))
> +
> +/*
> + * IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is set to 'y'
> + * or 'm', NULL otherwise.
> + */
> +#define IF_ENABLED(option, ptr) IF_ENABLED_OR_ELSE(option, ptr, NULL)
> +
> +#endif /* __LINUX_IF_ENABLED_H */
> 


thanks.
-- 
~Randy

