Return-Path: <linux-mips+bounces-14234-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMxWOvgw6WmLVgIAu9opvQ
	(envelope-from <linux-mips+bounces-14234-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 22:35:04 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C92944AA4C
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 22:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 918DF305D6DE
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2026 20:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D9C33C502;
	Wed, 22 Apr 2026 20:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dS5BPdfJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8692D77EE;
	Wed, 22 Apr 2026 20:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776889977; cv=none; b=r4kw6OZpmHM09rVrzzPAJeyTgOcvQ5j9RGS3Sk3ruPlsEx/397lGAAJXiythOeNx5rrlVaWMVUEJsCXR3m66jbmN1dHKaQcon/XMoF8X5dboXzQEPOTFYt80HstY90CEnVVp/Td5ka4oK9Ojb5Lxy782vwqxTqTv7FoMksvn/pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776889977; c=relaxed/simple;
	bh=enn9A5uWXBDGWbSPr5HjILyXbuFGLgH23EtNAkqn9kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUZhM3OvcuQpjOKvIh1586EDvMlcPTQycotUeG6fAUkvszFtbaNLA9w+y8MYq9214CqL/zJem/sc1sJz/nZFuOxe+4pQ1HC48WaQ9CSxDZQFqEb0INNBgKfOn/YlUJlAm5SBeSCM4J4E3wFAnJHTwwCOmgfCZ1Ui3MiovHZ92Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dS5BPdfJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776889975; x=1808425975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=enn9A5uWXBDGWbSPr5HjILyXbuFGLgH23EtNAkqn9kU=;
  b=dS5BPdfJgSEiLDxnKdmj+G6FRPjzD5K19sXyY7aCKbG1Vo2+Hlb9s06P
   sNJ0b+F1P0SDqQuZ+KaqRgjAZUxx0XP9Nszxz3pL2viTo3QNb2A3eC4oD
   gNc3gzxeErpeAwz9yjXo05XndSmEwnTEfWyqH4t42bubt7PJ9rKZfrnr3
   W/3wUhMBtid+mkxEhQwc6B2LByhEhXilGl+Q5Y0o5VxH/nloAwje2ypWk
   Clf0UMqVne28kPsbPiGOi2RapQiRBoZRsiU7D+U4pQxKnU/+yxQPyA2Sa
   I9h0Qn0gufhj4+6v12AjtfGFwfwSuRwSYnGQLHrikMtOMs3APe/lZGWMc
   Q==;
X-CSE-ConnectionGUID: vneAvToDQ6mld5IYNbPXYA==
X-CSE-MsgGUID: dVeGBksnQsqQtv+c5CliSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77835430"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="77835430"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 13:32:55 -0700
X-CSE-ConnectionGUID: W7RT61V5QOGsOgxgMIOXJg==
X-CSE-MsgGUID: p/rjs6SfSle3venrugbXFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="225942202"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 13:32:52 -0700
Date: Wed, 22 Apr 2026 23:32:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>
Cc: Felipe Ribeiro de Souza <felipers@ime.usp.br>, andy@kernel.org,
	dlechner@baylibre.com, jic23@kernel.org, nuno.sa@analog.com,
	paul@crapouillou.net, Lucas Ivars Cadima Ciziks <lucas@ciziks.com>,
	linux-iio@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 1/2] iio: adc: ingenic-adc: refactor
 ingenic_adc_read_chan_info_raw()
Message-ID: <aekwcosBXRXgRsPn@ashevche-desk.local>
References: <20260421221629.70401-1-felipers@ime.usp.br>
 <20260421221629.70401-2-felipers@ime.usp.br>
 <aeiJo3RCKFLEGLEt@ashevche-desk.local>
 <e62e3f14-c1fe-45bc-ae9e-760058dfca1d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e62e3f14-c1fe-45bc-ae9e-760058dfca1d@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14234-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C92944AA4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 04:28:24PM +0300, Sergey Shtylyov wrote:
> On 4/22/26 11:41 AM, Andy Shevchenko wrote:

[...]

> >> +		dev_err(iio_dev->dev.parent, "Failed to enable clock: %d\n",
> >> +			ret);
> > 
> > Make it a single line. It's fine to go a bit over 80 for readability purposes.
> 
>    And BTW the new checkpatch limit is 100 columns. :-)

Yes. But checkpatch has lower priority over documentation. Documentation
clearly says 80 and IIO tries to follow this.

-- 
With Best Regards,
Andy Shevchenko



