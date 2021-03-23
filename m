Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAADC3462E8
	for <lists+linux-mips@lfdr.de>; Tue, 23 Mar 2021 16:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbhCWPbj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Mar 2021 11:31:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:48580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232806AbhCWPbc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Mar 2021 11:31:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB060619B2;
        Tue, 23 Mar 2021 15:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616513492;
        bh=bJy+1pPqZ9b2Coh/IbNlRkCGydYdoUBWt094ZsN9XxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AlLjj+UTm8ohjArHF3/kLE6NH9IKV1+f0uhOgM+uE+6EEfjFhMkoRpuylFIncP92V
         vst7a9mUItBFvLggdjPLnwVDp061sfGmigo8KOUqA3SI/Oouxw73pAA/214cCUIXU7
         cACTgBTQ9nNiPQpRNJiKZQD/v6KcjQ4ggri/K8n4=
Date:   Tue, 23 Mar 2021 16:31:29 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     hminas@synopsys.com, paul@crapouillou.net,
        linux-mips@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com,
        Dragan =?utf-8?B?xIxlxI1hdmFj?= <dragancecavac@yahoo.com>
Subject: Re: [PATCH] USB: DWC2: Add VBUS overcurrent detection control.
Message-ID: <YFoJ0Z6K4B5smbQx@kroah.com>
References: <1616513066-62025-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1616513066-62025-1-git-send-email-zhouyanjie@wanyeetech.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 23, 2021 at 11:24:26PM +0800, 周琰杰 (Zhou Yanjie) wrote:
> Introduce configurable option for enabling GOTGCTL register
> bits VbvalidOvEn and VbvalidOvVal. Once selected it disables
> VBUS overcurrent detection.
> 
> This patch is derived from Dragan Čečavac (in the kernel 3.18
> tree of CI20). It is very useful for the MIPS Creator CI20(r1).
> Without this patch, CI20's OTG port has a great probability to
> face overcurrent warning, which breaks the OTG functionality.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> Signed-off-by: Dragan Čečavac <dragancecavac@yahoo.com>
> ---
>  drivers/usb/dwc2/Kconfig | 6 ++++++
>  drivers/usb/dwc2/core.c  | 9 +++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/Kconfig b/drivers/usb/dwc2/Kconfig
> index c131719..e40d187 100644
> --- a/drivers/usb/dwc2/Kconfig
> +++ b/drivers/usb/dwc2/Kconfig
> @@ -94,4 +94,10 @@ config USB_DWC2_DEBUG_PERIODIC
>  	  non-periodic transfers, but of course the debug logs will be
>  	  incomplete. Note that this also disables some debug messages
>  	  for which the transfer type cannot be deduced.
> +
> +config USB_DWC2_DISABLE_VOD
> +	bool "Disable VBUS overcurrent detection"
> +	help
> +	  Say Y here to switch off VBUS overcurrent detection. It enables USB
> +	  functionality blocked by overcurrent detection.

Why would this be a configuration option?  Shouldn't this be dynamic and
just work properly automatically?

You should not have to do this on a build-time basis, it should be able
to be detected and handled properly at run-time for all devices.

If you know this is needed for a specific type of device, detect it and
make the change then, otherwise this could break working systems, right?

thanks,

greg k-h
