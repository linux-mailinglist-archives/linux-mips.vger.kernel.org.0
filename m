Return-Path: <linux-mips+bounces-12457-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98165CBCDF7
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 08:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF99330341C6
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 07:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD7C3314C8;
	Mon, 15 Dec 2025 07:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWu4QSRe"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9443314C4;
	Mon, 15 Dec 2025 07:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765784083; cv=none; b=P7RtrnY4e9R1j/y3+qNZcq+sWgi8w+Reko9BPjgTyODA1G3gO8SmHv7MAGJVPhcaC7rv58wsvfg3wag61aWI7MjAvejllmx8rzXsz2BcL3tKNC5Y0s1uSlgsFO58DYGLvzJ4Fd4y+WOkIBJ+e4U+gJ/5JohgKAy/YBeJIy9XLXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765784083; c=relaxed/simple;
	bh=MiHBA0Fjs39oJZsLunvPoV7wu3p/ufM0CWOh6Ua3eNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Swi7HnHGn+n1WfvS/qtROab6ObV0cvBy5wyZL8GgyMUxQ1ySIghHcEuOfVSyz8AknnfQtGTipofK1xvxZ7evO/HhgeoXiOo72Tj3uRyaM4TmUX9LOjDyavmFeXP/7qfag08RmSvGoZJpvOVj5ZRrPzAvZ4pVShd32bNkJ2WLkxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWu4QSRe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3B1C116B1;
	Mon, 15 Dec 2025 07:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765784083;
	bh=MiHBA0Fjs39oJZsLunvPoV7wu3p/ufM0CWOh6Ua3eNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mWu4QSReA7/21kROu7snleZys0FL/fADcMJTYazobHY4EbQ2Qw2f6h+b755e4I0i7
	 bnRee12hv1iJUspSw+0J/nTby197CFFgzJpwUv4i261oSadu0Ih20pDD6pYrTD59Hf
	 ltw2if3QFcqm41srxhL+TuT/4R9/4XIH70Jm5p3WWJfIvVX1uKL09Rk51PCzy0xDHZ
	 MzRTnOqK/uadzI3T297337WKalt6eeYNgTnQHcU8whfTPIfC4ySnUTVvZ6AdsvhwT/
	 M4o4PnSAiuYE9QzaItYdQwev+FPUHgEO0uGxOseJDV5ZNgR5oJj8Vzasc5XIjFbY8Z
	 uJzbre/hCy/1A==
Date: Mon, 15 Dec 2025 16:34:37 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 13/17] firmware: tee_bnxt: Make use of tee bus methods
Message-ID: <aT-6DVAIS2sK6pxZ@sumit-X1>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <f0b513d92355a53d30d8fdfcbbf7250457ec470e.1765472125.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0b513d92355a53d30d8fdfcbbf7250457ec470e.1765472125.git.u.kleine-koenig@baylibre.com>

On Thu, Dec 11, 2025 at 06:15:07PM +0100, Uwe Kleine-König wrote:
> The tee bus got dedicated callbacks for probe and remove.
> Make use of these. This fixes a runtime warning about the driver needing
> to be converted to the bus methods.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
>  drivers/firmware/broadcom/tee_bnxt_fw.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
> index fbdf1aa97c82..a706c84eb2b6 100644
> --- a/drivers/firmware/broadcom/tee_bnxt_fw.c
> +++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
> @@ -181,9 +181,9 @@ static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
>  	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
>  }
>  
> -static int tee_bnxt_fw_probe(struct device *dev)
> +static int tee_bnxt_fw_probe(struct tee_client_device *bnxt_device)
>  {
> -	struct tee_client_device *bnxt_device = to_tee_client_device(dev);
> +	struct device *dev = &bnxt_device->dev;
>  	int ret, err = -ENODEV;
>  	struct tee_ioctl_open_session_arg sess_arg;
>  	struct tee_shm *fw_shm_pool;
> @@ -231,17 +231,15 @@ static int tee_bnxt_fw_probe(struct device *dev)
>  	return err;
>  }
>  
> -static int tee_bnxt_fw_remove(struct device *dev)
> +static void tee_bnxt_fw_remove(struct tee_client_device *bnxt_device)
>  {
>  	tee_shm_free(pvt_data.fw_shm_pool);
>  	tee_client_close_session(pvt_data.ctx, pvt_data.session_id);
>  	tee_client_close_context(pvt_data.ctx);
>  	pvt_data.ctx = NULL;
> -
> -	return 0;
>  }
>  
> -static void tee_bnxt_fw_shutdown(struct device *dev)
> +static void tee_bnxt_fw_shutdown(struct tee_client_device *bnxt_device)
>  {
>  	tee_shm_free(pvt_data.fw_shm_pool);
>  	tee_client_close_session(pvt_data.ctx, pvt_data.session_id);
> @@ -258,12 +256,12 @@ static const struct tee_client_device_id tee_bnxt_fw_id_table[] = {
>  MODULE_DEVICE_TABLE(tee, tee_bnxt_fw_id_table);
>  
>  static struct tee_client_driver tee_bnxt_fw_driver = {
> +	.probe		= tee_bnxt_fw_probe,
> +	.remove		= tee_bnxt_fw_remove,
> +	.shutdown	= tee_bnxt_fw_shutdown,
>  	.id_table	= tee_bnxt_fw_id_table,
>  	.driver		= {
>  		.name		= KBUILD_MODNAME,
> -		.probe		= tee_bnxt_fw_probe,
> -		.remove		= tee_bnxt_fw_remove,
> -		.shutdown	= tee_bnxt_fw_shutdown,
>  	},
>  };
>  
> -- 
> 2.47.3
> 

