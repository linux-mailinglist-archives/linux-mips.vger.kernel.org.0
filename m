Return-Path: <linux-mips+bounces-12456-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5362DCBCD09
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 08:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C40330274D3
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 07:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59049330B13;
	Mon, 15 Dec 2025 07:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxSfLzdO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4B330B0F;
	Mon, 15 Dec 2025 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765784024; cv=none; b=LyG1ogHMeDp3TSuFh1BIUu2SXumDCZCaAIiadgJuSPx4SycUQubhw/AS6aqETsXJ+h3uhMMfo54uokVUb4OzHWHVeST+jN9Z0WFwrdmnN9RouJmKaAWU60xtXrR+CYtx/AL8wskdv87gGeB3OBlmmeR+WBPc/AZPctXXHWgcGZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765784024; c=relaxed/simple;
	bh=5820ngv824z9uIu9EV45nBDdVf0Jn6z4pOSe9nMQUgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgxukrCVWHYZbEqZL9Gk0mCYAQR7Hj0hlnAOLu8LmZSWvNUcXZiHZr6zOfXU69zMXhISO34jUlMQu/PCpitOWYtFaLmLAwhODMeLC/FOP8sLj93YCp7qwNRlhG6LhunYP8srzsso4tqZwBNfl7IaJEaVK3Luc1iZ/qteiPNfUYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxSfLzdO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C11C4CEF5;
	Mon, 15 Dec 2025 07:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765784023;
	bh=5820ngv824z9uIu9EV45nBDdVf0Jn6z4pOSe9nMQUgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxSfLzdOgHpYOIjRNV+fICOTTU2fO1BZMdnpYaK5H994otGjw1ARZSr5IJbXGUYQR
	 DZEI4PJp2L5sJ8RxOT2hc0W2CENFG6paMyA3/inlUwRMkYB+AWQp0n6ryuOJyMYkcQ
	 dUy+vEzD7/WJrbHKswIq2Zq18iIuWeV+v/agisbgggBDfDKZL1i5sdkCUXeGT8Z4nX
	 UNzgNxuqZc0aGn0p7343OZcxE/hso0D9N3kq5isU6C6YHvDTOTgWONqgc+M9TgZN4v
	 kcvUQSMnOgm1AipiVMVATsJ7wZ9ePdxkREc7MXVp+Vv42UFf8pT4nJ8sA1L6soETqP
	 c9QesQEL1OVyg==
Date: Mon, 15 Dec 2025 16:33:37 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 12/17] firmware: tee_bnxt: Make use of
 module_tee_client_driver()
Message-ID: <aT-50by9eHqHQIYH@sumit-X1>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <5b520fd96f8b385acc280226f548913c9ee98011.1765472125.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b520fd96f8b385acc280226f548913c9ee98011.1765472125.git.u.kleine-koenig@baylibre.com>

On Thu, Dec 11, 2025 at 06:15:06PM +0100, Uwe Kleine-König wrote:
> Reduce boilerplate by using the newly introduced module_tee_client_driver().
> That takes care of assigning the driver's bus, so the explicit assigning
> in this driver can be dropped.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/firmware/broadcom/tee_bnxt_fw.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
> index 40e3183a3d11..fbdf1aa97c82 100644
> --- a/drivers/firmware/broadcom/tee_bnxt_fw.c
> +++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
> @@ -261,25 +261,13 @@ static struct tee_client_driver tee_bnxt_fw_driver = {
>  	.id_table	= tee_bnxt_fw_id_table,
>  	.driver		= {
>  		.name		= KBUILD_MODNAME,
> -		.bus		= &tee_bus_type,
>  		.probe		= tee_bnxt_fw_probe,
>  		.remove		= tee_bnxt_fw_remove,
>  		.shutdown	= tee_bnxt_fw_shutdown,
>  	},
>  };
>  
> -static int __init tee_bnxt_fw_mod_init(void)
> -{
> -	return driver_register(&tee_bnxt_fw_driver.driver);
> -}
> -
> -static void __exit tee_bnxt_fw_mod_exit(void)
> -{
> -	driver_unregister(&tee_bnxt_fw_driver.driver);
> -}
> -
> -module_init(tee_bnxt_fw_mod_init);
> -module_exit(tee_bnxt_fw_mod_exit);
> +module_tee_client_driver(tee_bnxt_fw_driver);
>  
>  MODULE_AUTHOR("Vikas Gupta <vikas.gupta@broadcom.com>");
>  MODULE_DESCRIPTION("Broadcom bnxt firmware manager");
> -- 
> 2.47.3
> 

