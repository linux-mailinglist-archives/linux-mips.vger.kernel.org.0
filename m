Return-Path: <linux-mips+bounces-14202-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAzcNy8P5WkXeAEAu9opvQ
	(envelope-from <linux-mips+bounces-14202-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 19:21:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC3F424DE6
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 19:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF95230041E8
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 17:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89A42D8796;
	Sun, 19 Apr 2026 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtDDFWFd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59D8263C8C;
	Sun, 19 Apr 2026 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776619309; cv=none; b=mf+/uxzXrakLPz3GYYYgqKdSW39GMeTq0N734DP4KgNZi6IVR72+aZe8W2125qAwWGhydQD1FR8Dj4xBx5NgzQalqnkdEOmG4WGiKLC+oQzToCk9oe2kzrPoEhNvdjyARIdNwRheewZzygDWWFxRVrq1ZVXSsYlca6OHCWp2RzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776619309; c=relaxed/simple;
	bh=GYZwc8FHiYs0qIpYDCCwWGPNWrRqE3NxkBcOsU47A2o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UiX+AGIt7E2eP75JMq+Kev1LrbhlB++WelcbUfFU/gU7bn+F7KHAiBNiVrhdIXCmxIKwv+N+7qDUVbAFTJUD66xC7RLJ7fA8EmpWYXe8ogdVrv687MbQZfnJeKGwDAoFfhwfnjrHCJeVajupIV8ebVjIDEGEpaFRgriQTW//DhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtDDFWFd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF43C2BCAF;
	Sun, 19 Apr 2026 17:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776619309;
	bh=GYZwc8FHiYs0qIpYDCCwWGPNWrRqE3NxkBcOsU47A2o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CtDDFWFd6H5Euuf38TZOcjibUFAkNUnsO8fYiSzxA4JgAXUUGa+lkCfGAaBaqOrnr
	 ksIUjBM05g/77HJyuMezehVwTLXIN5pUSae/94ZDDTpVY1AU77EZGdKEmmfZN+4Mwc
	 nO1xjlgPKv7J7a/nfXEoPl8iU0Wub4pEYhvjVx1WAo5IPSFMoWlhL5fNOv3sCZRhQK
	 Qf2VHq5qfwDm3ZnHd0bofE6GsdOGi9rm1rLTx4ciHelNn/NgJCr/RenPM8qbG9lokV
	 xePnu/6b+wQkmR+yTcVYsWi50GkFamy6iYSwE+rv6vm8ZJrlBgf1VvrL2YmSI9Ho/y
	 nxxMHN9JIrm3A==
Date: Sun, 19 Apr 2026 18:21:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Felipe Ribeiro de Souza <felipers@ime.usp.br>, paul@crapouillou.net,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, Lucas Ivars
 Cadima Ciziks <lucas@ciziks.com>, linux-mips@vger.kernel.org,
 linux-iio@vger.kernel.org
Subject: Re: [PATCH] iio: adc: ingenic-adc: use guard(mutex)(&lock) to
 handle synchronisation
Message-ID: <20260419182140.725830ab@jic23-huawei>
In-Reply-To: <aeHo7NFgvWe_3kPQ@ashevche-desk.local>
References: <20260416011815.9140-1-felipers@ime.usp.br>
	<aeHo7NFgvWe_3kPQ@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14202-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 6EC3F424DE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 17 Apr 2026 11:01:48 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Apr 15, 2026 at 10:18:11PM -0300, Felipe Ribeiro de Souza wrote:
> > Replace mutex_lock(&lock) and mutex_unlock(&lock) calls with
> > guard(mutex)(&lock) in functions ingenic_adc_set_adcmd,
> > ingenic_adc_set_config, ingenic_adc_enable, ingenic_adc_capture
> > and ingenic_adc_read_chan_info_raw.  
> 
> We refer to the functions as func().
> 
> > This removes the need to call the unlock function, as the lock is
> > automatically released when the function return or the scope exits
> > for any other case.  
> 
> ...
> 
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/property.h>
> > +#include <linux/cleanup.h>  
> 
> Preserve ordering.
> 
> ...
> 
> >  	/* We cannot sample the aux channels in parallel. */
> > -	mutex_lock(&adc->aux_lock);
> > +	guard(mutex)(&adc->lock);  
> 
> 	...
> 
> >  	ret = IIO_VAL_INT;
> >  out:
Holding the lock a bit longer might be fine, but please go read the
comments in cleanup.h.   The short version is don't combine use
of guard() with any gotos in the same function.
It's too high risk given different compiler behaviour and the chance of
code getting reorganized in the future

I wonder if anyone would be interested in applying ACQUIRE() and ACQUIRE_ERR()
to clock management.  Might be worth seeing if that is of interest and general
enough as then you could handle the clk_disable() as well.

> > -	mutex_unlock(&adc->aux_lock);
> >  	clk_disable(adc->clk);  
> 
> Not sure about this. At bare minimum you should elaborate on this change in the
> commit message.
> 
> >  	return ret;  
> 


