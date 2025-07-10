Return-Path: <linux-mips+bounces-9729-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2D4B00D3B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 22:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1AAF5A42F2
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 20:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E322FE37B;
	Thu, 10 Jul 2025 20:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TA6c2YcV"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAEE2FE370;
	Thu, 10 Jul 2025 20:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752179835; cv=none; b=nymM7plfb8NAfU5kuRjOuEbi3X8TEyATgLLWJGj1YYZpxW3Y0kjWP5x/ngFJyDc03XqSxJgDhHFOURNOv0LROiJVEZLBHn+P9YvpjIg/YngJtynOYII7ngUnnf4iV5E68kdX2aIAhgSBaBbu2TmMRwtmE8NhTmTHvanqra+rNQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752179835; c=relaxed/simple;
	bh=CgImUwkenH3liQ9C4iUaFmfKZb9tKRP5V6VjbmRzY7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XU9t/pgk5KUrjd/3UvxVCmIIOIlvtOhson3RzdZEHtyghaAYZeo0O1lc2AF6VfPBWJVq3AyeILoZJ3B2vcwqGU0Mk5R0pwkWaS0GqAhamb4FK1NfgukXNkGuLmRHLmex6XN5WpxLNe7CYnFhbJfGSiGxNFyOMT2HSe1iw9BWGAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TA6c2YcV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D23AC4CEF9;
	Thu, 10 Jul 2025 20:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752179835;
	bh=CgImUwkenH3liQ9C4iUaFmfKZb9tKRP5V6VjbmRzY7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TA6c2YcVTUWe8n7Xs2HiUhvJxDMcNT6SJjTUUXso5JEZKSsxFA3wb79FtxLbTTNwq
	 i54iGisjtcG3VMssx1SIWXEDDadm7Gebx0O0Jy9w6gGBizquH2j8hKMQIg4CB7XcfR
	 KXBMGANpwxlgjgpVQOBItGHx4qPCQg9TiZsw9ar/GKDsCsIfgwayem9liUNUvhWDfm
	 ZHyZhl1j3qdcsWlCktLbIYkQ3k/Xv5radA5gtc6opgrh1zr6wXDuDPgHzGrN2S06Ii
	 V2nJbm6F8gOqb8l3BkwdzdzAZdG7zIVa/0sGk1H70zDbsg5bwsP+rOXkSVC9CqdMqE
	 glSd795lbkl6Q==
Date: Thu, 10 Jul 2025 15:37:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 01/12] pinctrl: pinmux: open-code
 PINCTRL_FUNCTION_DESC()
Message-ID: <z5hmnijgcowad5d7kksqockdltuggf2mszrsxhyv6yqwo3jwqr@n6hslkul4mbq>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-1-b6135149c0d9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-1-b6135149c0d9@linaro.org>

On Wed, Jul 09, 2025 at 04:38:57PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This macro is only used in one place and pin function descriptors should
> only be created by pinmux core so there's no point in exposing it to
> other pinctrl users. Remove the macro and hand-code its functionality.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/pinmux.c | 3 ++-
>  drivers/pinctrl/pinmux.h | 7 -------
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index 0743190da59e819d1c72c1ed1ece72f206d60d65..daa7a11adabf672f802a8e9577c14e4da56b8678 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -893,7 +893,8 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
>  	if (!function)
>  		return -ENOMEM;
>  
> -	*function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
> +	function->func = PINCTRL_PINFUNCTION(name, groups, ngroups);
> +	function->data = data;
>  
>  	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
>  	if (error)
> diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
> index 2965ec20b77fb360ca244800e30f1eafa988a2b1..5c039fd09f7474b4c104d3c36e0e8b8dc73a2ddd 100644
> --- a/drivers/pinctrl/pinmux.h
> +++ b/drivers/pinctrl/pinmux.h
> @@ -141,13 +141,6 @@ struct function_desc {
>  	void *data;
>  };
>  
> -/* Convenient macro to define a generic pin function descriptor */
> -#define PINCTRL_FUNCTION_DESC(_name, _grps, _num_grps, _data)	\
> -(struct function_desc) {					\
> -	.func = PINCTRL_PINFUNCTION(_name, _grps, _num_grps),	\
> -	.data = _data,						\
> -}
> -
>  int pinmux_generic_get_function_count(struct pinctrl_dev *pctldev);
>  
>  const char *
> 
> -- 
> 2.48.1
> 

