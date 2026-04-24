Return-Path: <linux-mips+bounces-14300-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMXAMbgm62muJAAAu9opvQ
	(envelope-from <linux-mips+bounces-14300-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 10:15:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A03345B497
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 10:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3983300CBF4
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 08:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409923659F6;
	Fri, 24 Apr 2026 08:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHYLKzVE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAA922256F;
	Fri, 24 Apr 2026 08:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018454; cv=none; b=vBaeBi83Z3cDYbkZQyJlgEzLkeqANmVLjpV8P37lVkcZYHdAkahoU2mDxH7yy4Lyj+xR9Qd01ClJVq0WGfm4A4KmFK/lZkp5Qg+dG1pn9pABE0x00KIh4fuuv/zRLpixYMm5CTBb2xVnL5IM9Gc0LiE76ej0MJqTEhfHZdG3ggQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018454; c=relaxed/simple;
	bh=kGtWYwUs4IRFMHFVo9srer3MqS06pejhepP9ltUIZUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4t6V+FcQ4fpXHNjX9undWiSPlaOWCYnbaxOfBKwRVwtLgDaMbuLspegbSCvtz6Lmzgi5DVM21FEmNAcOk6XG1IP+LCIISWdGaHrdLYJeye3pN9VJ0IvAVWHYyM6PNwhyoyLScqMKRxK1MZtXsMcJJFBzqSZns9z30W5t2NcM5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHYLKzVE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777018453; x=1808554453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kGtWYwUs4IRFMHFVo9srer3MqS06pejhepP9ltUIZUE=;
  b=IHYLKzVESkr4L2VKGfjRocd/MVSwBcYKti0GNxoADkgDf5ltENU66GWJ
   AgM6YkjLuV0186jfzrINFIHp0DBbph3qF2v7JfpPFo4VrD7BQnCXBH24J
   07ZycYSIwEoJd8O1nIy7I5uXkniOrOv9NYq88OSTzjP4mEkP8X1vII8bb
   tX0g1SZFc8mLsSp1G/E4uCtGJ0rR3+F72xOQ4vHixCKnl/Lh7iptg2lpU
   eaJtSQn7B2HuTmfZGl0B4WiDCK9D4sLUZoJHvNlVUijBUYqGr0z+WPxF2
   +lQc34b4QpyOm0v63xrFK/oDyvgdhGSTRdp4Ut2EMSW5y7KMU7SuPVQ73
   g==;
X-CSE-ConnectionGUID: QIobiP9qRS6vZh+CRnvd+A==
X-CSE-MsgGUID: ff4NZqlfQme5EKJtIWKQcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="78189167"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="78189167"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:14:12 -0700
X-CSE-ConnectionGUID: bflHb2TbS56Kg/4ZlISZ6w==
X-CSE-MsgGUID: igxRKsRWQ1W8Zxe1mTXtNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="232035003"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:14:10 -0700
Date: Fri, 24 Apr 2026 11:14:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Felipe Ribeiro de Souza <felipers@ime.usp.br>
Cc: andy@kernel.org, dlechner@baylibre.com, jic23@kernel.org,
	nuno.sa@analog.com, paul@crapouillou.net,
	Lucas Ivars Cadima Ciziks <lucas@ciziks.com>,
	linux-iio@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: ingenic-adc: use guard()() to handle
 synchronisation
Message-ID: <aesmT26uMeGygV_y@ashevche-desk.local>
References: <20260423012011.41001-1-felipers@ime.usp.br>
 <20260423012011.41001-3-felipers@ime.usp.br>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423012011.41001-3-felipers@ime.usp.br>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 5A03345B497
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14300-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]

On Wed, Apr 22, 2026 at 10:18:31PM -0300, Felipe Ribeiro de Souza wrote:
> Replace mutex_lock() and mutex_unlock() calls with guard()()
> in functions ingenic_adc_set_adcmd(), ingenic_adc_set_config(),
> ingenic_adc_enable(), ingenic_adc_capture() and
> ingenic_adc_read_chan_locked().
> 
> This removes the need to call the unlock function, as the lock is
> automatically released when the function return or the scope exits
> for any other case.

...

> static int ingenic_adc_read_chan_locked(struct ingenic_adc *adc,

>  	switch (chan->channel) {
>  	case INGENIC_ADC_AUX0:

>  		break;
>  	}
>  
> -	ret = IIO_VAL_INT;
> -out:
> -	mutex_unlock(&adc->aux_lock);
> -
> -	return ret;
> +	return IIO_VAL_INT;
>  }

Just a side note (it was already like this in the original code).
The switch-case has no default case and in unlikely event of code
modification or run-time flow we will return this instead of some
error code. That said, I think it's better to return directly from
each of the cases and add default case with an error code returned
(probably in a preparatory patch?). In any case it's up to you and
maintainers, since your patch doesn't change the state of affairs.

-- 
With Best Regards,
Andy Shevchenko



