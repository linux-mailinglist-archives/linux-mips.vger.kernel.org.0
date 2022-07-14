Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E17D575057
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jul 2022 16:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240076AbiGNOHU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jul 2022 10:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240200AbiGNOHR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jul 2022 10:07:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD15388
        for <linux-mips@vger.kernel.org>; Thu, 14 Jul 2022 07:07:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 55CFFB824E6
        for <linux-mips@vger.kernel.org>; Thu, 14 Jul 2022 14:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C3EC34114;
        Thu, 14 Jul 2022 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1657807633;
        bh=kRx26AxO23Zw8Y7aYXnPPS/liO8eqKqGSD3Lqybvb+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kf0ZPk1/3q22yIlhyOP28HwWbdgSIF6MTZdN8rgoVhsfWXVvccWkj/reEF+5vKZGc
         M712mFFfrFPAFlF/r/0OjtXdiVn3T5u2U7vs5euvn0q48c4UuxHm9kzmL0KLlg0g1X
         ml/cscR/jfqHE07A7dGFmW+OscojTKxk0mbeU1NU=
Date:   Thu, 14 Jul 2022 15:31:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     sohu0106 <sohu0106@126.com>
Cc:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        security@kernel.org
Subject: Re: buffer overflow in vpe_write() function of arch/mips/kernel/vpe.c
Message-ID: <YtAamKIXPQ1aNJx9@kroah.com>
References: <71b5d25.71d1.181fcd701cf.Coremail.sohu0106@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71b5d25.71d1.181fcd701cf.Coremail.sohu0106@126.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 14, 2022 at 09:12:38PM +0800, sohu0106 wrote:
> 
> In the vpe_write function of arch/mips/kernel/vpe.c, parameter "size_t count" is pass by userland, if "count" is very large, it will bypass the check of "if ((count + v->len) > v->plen)".(such as count=0xffffffffffffffff). Then it will lead to buffer overflow in "copy_from_user(v->pbuffer + v->len, buffer, count)".
> 
> 
> diff --git a/arch/mips/kernel/vpe.c_org b/arch/mips/kernel/vpe.c
> index d0d832a..bd1f826 100644
> --- a/arch/mips/kernel/vpe.c_org
> +++ b/arch/mips/kernel/vpe.c
> @@ -871,7 +871,7 @@ static ssize_t vpe_write(struct file *file, co  nst char __user *buffer,
>         if (v == NULL)
>                 return -ENODEV;
> 
> -       if ((count + v->len) > v->plen) {
> +       if ((count + v->len) > v->plen || count + v->len > v->len)   {
>                 pr_warn("VPE loader: elf size too big. Perhaps str  ip unneeded symbols\n");
>                 return -ENOMEM;
>         }
> 

Note, there is no need to cc: security@k.o when you also cc: public
mailing lists, as the developers there should handle the issue.

Also, your patch is corrupted with whitespace turned into spaces, making
it impossible to apply, and you forgot a signed-off-by line.  Try
running scripts/checkpatch.pl on your patches before sending them out,
that will catch things like this.

thanks,

greg k-h
