Return-Path: <linux-mips+bounces-14226-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCQdGP2J6Gk6LgIAu9opvQ
	(envelope-from <linux-mips+bounces-14226-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 10:42:37 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA77E443972
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 10:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 161073002126
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 08:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D92F3C0613;
	Wed, 22 Apr 2026 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFjR78bZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C5F3BFE5C;
	Wed, 22 Apr 2026 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776847275; cv=none; b=AiqFZN5yzISBOcsC261Bjesg5mlM2lMZukjlzwMmLw5KoJwltNpCBFuApIjyiO57RCoOWNcLNw2MVQ3xrFopze1Z9MfujBhi5zxGWWvuOpo+xxkd2DxhdPErxjlGJ0Kr6pUssFO0t/NtWjrfl1GdZh1koRqOQUpqQWy3CqGnB0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776847275; c=relaxed/simple;
	bh=/pVYTyXvUYC7oHHEY2udeqBONAs6bUtawkH8/DRwLHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsOxGleSYKHoVt9X46QOTaFMX5s63tpcoYdsfiQA76Bceb7+hSxNr8+wtx6AtnGHYEm4oOrgOk5rdOwwRwtzz1YaifCWYZYaB1RQRtsBg63xozflTEddpcwpxQwdpYyqlsim/e14X3yT7vz4Av5UOSIARWhckUPMrtDBBWSAORY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFjR78bZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776847272; x=1808383272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/pVYTyXvUYC7oHHEY2udeqBONAs6bUtawkH8/DRwLHI=;
  b=MFjR78bZOEh0oe4hqMRx8B2zAG688AJH/7thA8131g/ouPhEl6yWuOr8
   w0cr8lsPv/N5TeEePfyPkP0WGtvSpELG3unLj577W85jzvgdBfjYqTI1S
   nofr6m/2tAPppmrK3WcEDNH95Vgx1T2RfU4wk760DhTO8SHB4ainOJBAm
   4p34bkYrFguzZep31J1M1HMoumeV3+kugvLMafEeWEsQoJjahTq2DjOwN
   JNWSKksCmin4VEqXECd0XdAwgUjfYLtB5M2iIpPhQ8Ce2N/ntQcsSKEsy
   16h1qjHWEqMDowkK2xFNMOietzL79uHMZldNVxVtzUtlB3Sb5/07lVbQf
   w==;
X-CSE-ConnectionGUID: rquouoMCSn+usTtBxxVGIg==
X-CSE-MsgGUID: eAaf2R8VQbCCNOKnSpI5hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77672201"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77672201"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:41:12 -0700
X-CSE-ConnectionGUID: oz5BCi1wTp+hzXLfvnAZQA==
X-CSE-MsgGUID: jtK8P0u0R+ynPRlvsjMHrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="229623517"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 01:41:09 -0700
Date: Wed, 22 Apr 2026 11:41:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Felipe Ribeiro de Souza <felipers@ime.usp.br>
Cc: andy@kernel.org, dlechner@baylibre.com, jic23@kernel.org,
	nuno.sa@analog.com, paul@crapouillou.net,
	Lucas Ivars Cadima Ciziks <lucas@ciziks.com>,
	linux-iio@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 1/2] iio: adc: ingenic-adc: refactor
 ingenic_adc_read_chan_info_raw()
Message-ID: <aeiJo3RCKFLEGLEt@ashevche-desk.local>
References: <20260421221629.70401-1-felipers@ime.usp.br>
 <20260421221629.70401-2-felipers@ime.usp.br>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421221629.70401-2-felipers@ime.usp.br>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14226-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: AA77E443972
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 07:14:58PM -0300, Felipe Ribeiro de Souza wrote:
> Extract the sample logic from ingenic_adc_read_chan_info_raw() into
> a new helper function ingenic_adc_read_chan_locked() to improve code
> readability and modularity.
> 
> The helper handles the mutex-protected section for sampling channels,
> while the main function manages clock enabling/disabling.

...

> +static int ingenic_adc_read_chan_info_raw(struct iio_dev *iio_dev,
> +					  struct iio_chan_spec const *chan,
> +					  int *val)
> +{
> +	int ret;
> +	struct ingenic_adc *adc = iio_priv(iio_dev);

Please, keep it as in reversed xmas tree order.

> +	ret = clk_enable(adc->clk);

> +

Redundant blank line.

> +	if (ret) {
> +		dev_err(iio_dev->dev.parent, "Failed to enable clock: %d\n",
> +			ret);

Make it a single line. It's fine to go a bit over 80 for readability purposes.

> +		return ret;
> +	}
> +
> +	ret = ingenic_adc_read_chan_locked(adc, chan, val);
> +
>  	clk_disable(adc->clk);
>  
>  	return ret;

-- 
With Best Regards,
Andy Shevchenko



