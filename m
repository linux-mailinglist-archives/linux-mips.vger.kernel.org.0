Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E948D4E02
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 09:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728732AbfJLHfh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 03:35:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:38468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727014AbfJLHfh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 12 Oct 2019 03:35:37 -0400
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62B002067B;
        Sat, 12 Oct 2019 07:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570865736;
        bh=GxHn9HvGbNAY8QyAyt0bW9sVjM5iu68qu3vwy7Md6hw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wf0Chk14Q8JRdONhUFmvnnjQF+nf84HsjEcys57x/X2LyBiiaLSOL0wLH1SNjY7QJ
         +AHjCBhflbxwGYJN8LBpK7MhTp3WmXkco4A7Ohj3HxZGNIrrFzJxzaeocaR0NYvcef
         BoI72kqFgiRNidLDZIyhTQdnodkX8I4Ny1Ak2f6U=
Date:   Sat, 12 Oct 2019 09:35:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, mark.rutland@arm.com,
        syq@debian.org, ulf.hansson@linaro.org, linus.walleij@linaro.org,
        armijn@tjaldur.nl, tglx@linutronix.de, yuehaibing@huawei.com,
        malat@debian.org, ezequiel@collabora.com, paul@crapouillou.net,
        linux-serial@vger.kernel.org, jslaby@suse.com,
        jiaxun.yang@flygoat.com, 772753199@qq.com
Subject: Re: [PATCH v3 1/2] Serial: Ingenic: Add support for the X1000.
Message-ID: <20191012073531.GA2036970@kroah.com>
References: <1548667176-119830-1-git-send-email-zhouyanjie@zoho.com>
 <1548695029-11900-1-git-send-email-zhouyanjie@zoho.com>
 <1548695029-11900-2-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548695029-11900-2-git-send-email-zhouyanjie@zoho.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Oct 12, 2019 at 01:13:23PM +0800, Zhou Yanjie wrote:
> Add support for probing the 8250_ingenic driver on the
> X1000 Soc from Ingenic.
> 
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  drivers/tty/serial/8250/8250_ingenic.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

<snip>

you seem to have two patches merged into one here, please fix up and
resend.

thanks,

greg k-h
