Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7FFF30DB50
	for <lists+linux-mips@lfdr.de>; Wed,  3 Feb 2021 14:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbhBCNab (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 08:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhBCNa1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Feb 2021 08:30:27 -0500
Received: from nbd.name (nbd.name [IPv6:2a01:4f8:221:3d45::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB384C061573;
        Wed,  3 Feb 2021 05:29:30 -0800 (PST)
Received: from [2a04:4540:1401:2ac::c66]
        by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <john@phrozen.org>)
        id 1l7IDn-00017Z-Rx; Wed, 03 Feb 2021 14:29:27 +0100
Subject: Re: [PATCH] MIPS: ralink: manage low reset lines
To:     Sander Vanheule <sander@svanheule.net>, linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
References: <20210203092140.12458-1-sander@svanheule.net>
From:   John Crispin <john@phrozen.org>
Message-ID: <c531b885-1542-8c4d-64ce-2f9d87cb79a2@phrozen.org>
Date:   Wed, 3 Feb 2021 14:29:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210203092140.12458-1-sander@svanheule.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 03.02.21 10:21, Sander Vanheule wrote:
> Reset lines with indices smaller than 8 are currently considered invalid
> by the rt2880-reset reset controller.
>
> The MT7621 SoC uses a number of these low reset lines. The DTS defines
> reset lines "hsdma", "fe", and "mcm" with respective values 5, 6, and 2.
> As a result of the above restriction, these resets cannot be asserted or
> de-asserted by the reset controller. In cases where the bootloader does
> not de-assert these lines, this results in e.g. the MT7621's internal
> switch staying in reset.
>
> Change the reset controller to only ignore the system reset, so all
> reset lines with index greater than 0 are considered valid.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
Acked-by: John Crispin <john@phrozen.org>
> ---
> This patch was tested on a TP-Link EAP235-Wall, with an MT7621DA SoC.
> The bootloader on this device would leave reset line 2 ("mcm") asserted,
> which caused the internal switch to be unresponsive on an uninterrupted
> boot from flash.
>
> When tftpboot was used in the bootloader to load an initramfs, it did
> initialise the internal switch, and cleared the mcm reset line. In this
> case the switch could be used from the OS. With this patch applied, the
> switch works both in an initramfs, and when (cold) booting from flash.
>
>   arch/mips/ralink/reset.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/ralink/reset.c b/arch/mips/ralink/reset.c
> index 8126f1260407..274d33078c5e 100644
> --- a/arch/mips/ralink/reset.c
> +++ b/arch/mips/ralink/reset.c
> @@ -27,7 +27,7 @@ static int ralink_assert_device(struct reset_controller_dev *rcdev,
>   {
>   	u32 val;
>   
> -	if (id < 8)
> +	if (id == 0)
>   		return -1;
>   
>   	val = rt_sysc_r32(SYSC_REG_RESET_CTRL);
> @@ -42,7 +42,7 @@ static int ralink_deassert_device(struct reset_controller_dev *rcdev,
>   {
>   	u32 val;
>   
> -	if (id < 8)
> +	if (id == 0)
>   		return -1;
>   
>   	val = rt_sysc_r32(SYSC_REG_RESET_CTRL);
