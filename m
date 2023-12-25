Return-Path: <linux-mips+bounces-827-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF5381E0E5
	for <lists+linux-mips@lfdr.de>; Mon, 25 Dec 2023 14:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7A081C211FE
	for <lists+linux-mips@lfdr.de>; Mon, 25 Dec 2023 13:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078E251C4F;
	Mon, 25 Dec 2023 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="IhhYug3F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qTXks8jq"
X-Original-To: linux-mips@vger.kernel.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C53151C35
	for <linux-mips@vger.kernel.org>; Mon, 25 Dec 2023 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 02F5D32001E9;
	Mon, 25 Dec 2023 08:33:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 25 Dec 2023 08:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1703511234;
	 x=1703597634; bh=fAYp03LfeyrOYF5KJpuLa2HSL44OwLK7X57G1OL3lt4=; b=
	IhhYug3FGU0dEUth4hMqyM//zs/eD2ckVVU6aKAImAWOEZkkKdKpTR4/ay4as18Z
	otGmRUqafc0thAgGsuC0SODM/59tw4Czk7qsICu8IiK65XsQnpXB3wrWmTpRzlkw
	skpJkn6QPZdkCUw6vtdcBGz+prrg5ST9XFiEqVmuVp+pEZQjLWyQnBtZW4HPm+fV
	WAFxEIVimC3+h2BeKB8kvzNiL9TlVkRXku/B/GYpH7+RUNfx0Uk0d+9GOrg3UElg
	N4PlBLRrKuyKki/puxaj9ar0RZuAUeJTYIPzgfB0eVRY/uQfQzpALSjJAWaNAI32
	m0N9trRaHHYBovyFR3fUfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1703511234; x=
	1703597634; bh=fAYp03LfeyrOYF5KJpuLa2HSL44OwLK7X57G1OL3lt4=; b=q
	TXks8jqtxRi83OyqHQ2uxSW2In3L21j3AsW9FEcCC4/0k7yHFeJf7kgIhAnTJIQE
	1/uiaOm3pK5slM45Lif6nKhy3DI3QGZFjiObLue74RXgNYKQOb8AxgZVpaiFyqWr
	W4auLYur8bLQT+N0rTjaCeWNPCceNzqtXWVqktXblKVB/g7+eeFf6NAji68zeQF2
	W2Ek1VLM8SD1Za+Mr8/gYraywD/wRhZ8YfTTHGsuqeHn8SXnc8uWykGf2KjJ4tUJ
	9J4Ylru6Y0BAL+0F42hsm4FNLjh9RIJFYxNoNofwueGd+kAo8e3y1VtfFsfiFGAp
	RN6qV/BwcWfnJuqnxDc7A==
X-ME-Sender: <xms:woSJZaSgC69t8YmMG_AZ6_NhwgupzjMIXRlE7sQTr3qzq8z4EEGgxA>
    <xme:woSJZfzZbJFhNIf91afxERjRX64UoX5FeKuA9fwr88YLKPoTYx0GfN9YSl03_ITD6
    -0inskGBwesqfOJ3cg>
X-ME-Received: <xmr:woSJZX2Q4Sq6bsrGG8czeGxEtRh3iMWr5_DqYIPUDswz8DRgxEzTRFkl9uqSarpSg_T9T8pmo3okkfbNxX-9M-8MDLLPuZsvFCpiFDk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddvfedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtke
    ertddtvdejnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeegjeevheeufeehje
    dvgeeigedugeethfeugfejteetheeugeehteduffeludefnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:woSJZWA_-sdnK0_lz94c6Kpd_uiWHM04fETz_qtnnJRJ6koLw0dJRw>
    <xmx:woSJZTgAQeNTmIruuVadfoayAupeS7QPtoJHBIQxK1qkjoAySVjIlw>
    <xmx:woSJZSoEZm2T_P9x5SrghzrUoh1A3jk2f3ZOQEyUDeyQpNMxc_h7uw>
    <xmx:woSJZTJgL03cH3A4UDHArvDGuYB15jrvoj_8n58QKr9hfqJpgWQOAA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Dec 2023 08:33:53 -0500 (EST)
Message-ID: <ec0cc350-9c29-4c95-9ec7-871aaefe8cd2@flygoat.com>
Date: Mon, 25 Dec 2023 13:33:52 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: question: malta doesn't use a1 for fdt from bootloader
To: dan@telent.net, linux-mips@vger.kernel.org
References: <87plyyrupy.fsf@telent.net>
Content-Language: en-US
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <87plyyrupy.fsf@telent.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2023/12/22 17:51, dan@telent.net 写道:
> 
> Newbie question:
> 
> I noticed while writing some test automation with QEMU and U-Boot that
> the Malta kernel appears to ignore any DTB provided by the bootloader, in
> favour of using the one embedded into the kernel image. Is there a
> reason behind this, or is it just not a thing that's been changed since
> the board was converted to use device tree?

Hi,

It's a bit of history that DeviceTree passed by YAMON bootloader to 
kernel does not compatible with upstream kernel's devicetree bindings,
so we decided to just omit it.

> 
> I patched my own kernel to check $a1 as the "mips generic" kernel does,
> and it seems to work, but maybe I'm missing something? I did have to
> rebuild U-Boot with different CONFIG options to make use of it (I don't
> khow what real hardware Malta uses for a bootloader) so perhaps it has
> limited use.
> 
> If the change is acceptable in principle I'll tidy it up and submit
> a patch with all the proper procedure.

I'm not sure if this is ok for YAMON-DT systems, will check on those 
systems.

Thanks
- Jiaxun
> 
> Opinions welcome
> 
> -dan
> 
> 
> diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
> index 21cb3ac1237b..52e731f9b4e2 100644
> --- a/arch/mips/mti-malta/malta-setup.c
> +++ b/arch/mips/mti-malta/malta-setup.c
> @@ -192,7 +192,9 @@ static void __init bonito_quirks_setup(void)
>   
>   void __init *plat_get_fdt(void)
>   {
> -       return (void *)__dtb_start;
> +       return (fw_arg0 == -2) ?
> +               (void *) (KSEG1ADDR(fw_arg1)) :
> +               (void *) __dtb_start;
>   }
>   
>   void __init plat_mem_setup(void)
> 

