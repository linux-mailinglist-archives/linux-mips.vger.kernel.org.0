Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D852EB7F8
	for <lists+linux-mips@lfdr.de>; Wed,  6 Jan 2021 03:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbhAFCFy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jan 2021 21:05:54 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:51561 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725824AbhAFCFx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jan 2021 21:05:53 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 06BB1580519;
        Tue,  5 Jan 2021 21:04:48 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Tue, 05 Jan 2021 21:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=EIM6GS5ja8jI10tIrcoiehRXu46Eoja
        p54gHcK8nO5E=; b=RSLpXl1c8Rr0TxRHMJwzmnRPvasVcTbaVkVlf0cqtdpLs7d
        tAXAGnmefbMpW6/yojzrVk8UtzQDdToEUuoFfeu/Bm6+QKD+9AXovOlDiWPRHbVH
        jzS9sqyuRA2fPnySiYt47HVQ54qggTiVeyuvLFMA2x0S2s+X3p7bte84fy2ylSIG
        8hFFqW4Ea529oZYNkWI8xuBQzFuLsU9Qy9HE9FQGfvdNyRrn4Jzhv2++ON6opQ2a
        6VJGPBvBvXEdmZXNsMvemrq6T/Y6Rf245fDZSAQpzJIVbVfmKet6+ViY0vCrj3as
        BkTXUwsTMaa22olN4ffOJbJEJb0R0hZsnoNAqng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EIM6GS
        5ja8jI10tIrcoiehRXu46Eojap54gHcK8nO5E=; b=M0fA7XXiYCqEDVIQZ1UQQN
        y9nhOUuWwvRTa9EBWVn+apsqe6fiHdKbA0QvaIyojD91KD4RmS3WpdupfwqsQKwJ
        A27U6H5MCAB/6OEy/1hvY7ob8zLvTOJ5kgzjA5jqwQHbj4NM9EC37uXPuOOtxVvq
        s/5VF9brFBseEXRXd/+8wnZkyD6lHpjQ2I48EPquG5FOKFrEUQi1m350qSFhQ88V
        iBYCgwLnxhlAYKDUl5MkhSf0KIMzY/G7KVOqv2yS8HGPOwgi1kvY1s/QnQfBHlDG
        TUfMk9i7JapXPuC7WC6w8hI6GAvHmyL7RT+ZZqQznnbiG36WWfDnsQYfRa7Uh/TQ
        ==
X-ME-Sender: <xms:vRr1Xx1oGQ0xdQ3fQNaTBQ9HIQ0pVTeuJk4sjVyCpsr3d7H8Q6vHEA>
    <xme:vRr1X4F-DdAqAFx5GYtbSmi44pT4h7LOcoo-ZDX2ikHU7gSHhfY1Ljh9CDV-HMTgY
    WyMmEALE-OhLZNwF9I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefkedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeeiieffuddvfeeihfefjeelkedvtdeugfekkefghefhhfef
    teeltdeuueefhfetheenucffohhmrghinhephhgvrggurdhssgenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:vRr1Xx4bsylSvhkdopQfLoUK8Db8uVhOuQNZeCEfBkDcwSJ1ttRPfw>
    <xmx:vRr1X-3rKvRSYWjoHGGsWwW7NFmTx4zrYvn_rI3z_SsWqvnmKADrbA>
    <xmx:vRr1X0Em_cYw-lqK2dqCNwuS3APCV7swLPqTSgtrwYCzkPHgbwo0lQ>
    <xmx:vxr1X_M9kVMYGYpcMfV10PqC4aUaLygxfpHl5yxwWURrxRzkU8VpXg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 6F0D1C200A5; Tue,  5 Jan 2021 21:04:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <79a48288-509a-40e3-ba89-24b6f713117e@www.fastmail.com>
In-Reply-To: <1609894059-6112-1-git-send-email-hejinyang@loongson.cn>
References: <1609894059-6112-1-git-send-email-hejinyang@loongson.cn>
Date:   Wed, 06 Jan 2021 10:04:24 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Jinyang He" <hejinyang@loongson.cn>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: zboot: Avoid endless loop in clear BSS.
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Wed, Jan 6, 2021, at 8:47 AM, Jinyang He wrote:
> Commit 2ee1503e546f ("MIPS: zboot: head.S clean up").
> 
> After .noreorder removed, clear BSS fall into endless loop. The bne
> instruction will add nop to the delay slot at compile time. So a0
> register will not increment by 4. Fix it and clear BSS from _edata
> to (_end - 1).

Oops, my fault.
My QEMU based local test setup somehow never really tested zboot.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks!

- Jiaxun

> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/boot/compressed/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
> index 070b2fb..5795d0a 100644
> --- a/arch/mips/boot/compressed/head.S
> +++ b/arch/mips/boot/compressed/head.S
> @@ -26,8 +26,8 @@
>  	PTR_LA	a0, _edata
>  	PTR_LA	a2, _end
>  1:	sw	zero, 0(a0)
> +	addiu	a0, a0, 4
>  	bne	a2, a0, 1b
> -	 addiu	a0, a0, 4
>  
>  	PTR_LA	a0, (.heap)	     /* heap address */
>  	PTR_LA	sp, (.stack + 8192)  /* stack address */
> -- 
> 2.1.0
> 
>

-- 
- Jiaxun
