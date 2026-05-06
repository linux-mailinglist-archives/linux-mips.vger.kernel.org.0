Return-Path: <linux-mips+bounces-14487-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TXVELq2E+2nXcAMAu9opvQ
	(envelope-from <linux-mips+bounces-14487-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 20:13:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0747F4DF2A5
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 20:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C51F630056D2
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 18:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6461147ECE2;
	Wed,  6 May 2026 18:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxeynPjR"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAEC3ED5C8;
	Wed,  6 May 2026 18:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091178; cv=none; b=lwXWrf4KlRgzz4e00AeFcz2q4gjs0yZx6kK/+VvuEl1FPMY15iysQM0zQVgPm3n1Xkq/KF2V18d+lH/7MRBp2w1Ot6bazZOgxUooPsDC6tIQ5QcSRLKtMkwKTxCemvmReBuNp1PfzmZ0X16008l93ZxSK7bonhfYKbQ5FEPArBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091178; c=relaxed/simple;
	bh=FhJgyONvvTi9EeHcdBQw/ziyoLtmCuVthg18mTynIMs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vC5t7J9JUfFNkFJbuMy5grjSpamKZw1rroam0rMBdH8LCQrRidgNfongeX+0D7U4BRI1EneRDITF7yaSTZvWN68P1V6zUIeosoDa57kk9F/5GtIjoh86QPp6rQwhaB5fuyGR3+9Jd0A3IWNKn8Fzv+Usn5jb1uR9eUbq00ztog8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxeynPjR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9972C2BCB0;
	Wed,  6 May 2026 18:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778091177;
	bh=FhJgyONvvTi9EeHcdBQw/ziyoLtmCuVthg18mTynIMs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YxeynPjRA+kv0+SSEOVRGm3jEfNkjp/00TZ1BzhgPJxHj8KhV4OywWmLX57IMB0xN
	 bFXzsqarTEugeZAbai998m8KTEkNOgODXa+BlMZ+JRdiCL9JFLjTZqTtj8pQUOPzEm
	 qDY1PL206tILmMzoqGpckfIys6rUAue8A/Xeer+YSDj+XBeshRQ0RE86S4sWPrNmpS
	 ijfgxhJbx3IbSc/ajFNAjXgjjymed6l1VZq4cMKofXIjZq8evrwzCEzbVs7SQj4ssZ
	 fsxzf5A7Kp5sHRD58SNFj3NI3uO30naZTGfaNI79MkgeYrp5OP7U4njepjQvPO1IHf
	 yWOa0zcUsVMLA==
Date: Wed, 6 May 2026 19:12:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Felipe Ribeiro de Souza <felipers@ime.usp.br>, andy@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, paul@crapouillou.net,
 linux-iio@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 0/3] iio: adc: ingenic-adc: use guard()() to handle
 synchronisation and refactor lock-held helpers
Message-ID: <20260506191249.18d5dd1f@jic23-huawei>
In-Reply-To: <afsH24xuP1GF9jYz@ashevche-desk.local>
References: <20260506022454.128169-1-felipers@ime.usp.br>
	<afsH24xuP1GF9jYz@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0747F4DF2A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14487-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]

On Wed, 6 May 2026 12:20:27 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, May 05, 2026 at 11:24:27PM -0300, Felipe Ribeiro de Souza wrote:
> > In drivers/iio/adc/ingenic-adc.c:
> > - Refactor ingenic_adc_read_chan_info_raw() and ingenic_adc_enable_unlocked()
> > - Replace mutex_lock() and mutex_unlock() calls with guard()()  
> 
> This version LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> In case you want to cook more cleanups, I provided a couple of side notes.
> 

Applied to the testing branch of iio.git

thanks

Jonathan

