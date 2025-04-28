Return-Path: <linux-mips+bounces-8841-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C758CA9E807
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 08:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EA4D173429
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 06:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D987D1C726D;
	Mon, 28 Apr 2025 06:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sQzl7JoK"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68631714B3
	for <linux-mips@vger.kernel.org>; Mon, 28 Apr 2025 06:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745820734; cv=none; b=jsJAKW+XBSeTQ/SvBYC+SDZAgZRcQ52SMkBVkfDzsrCxoTqxeiSYWPWGheYaNnI6cYqM/lPAZTJay9pldmqS/19TKXoESVuuq3PbUJgV7wn/nQCR5nYLenAaWI1+FV0DkfBqXQzbtGSCNWTnrHhdFKtleuq9MZwvtidNl6aWaZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745820734; c=relaxed/simple;
	bh=8CwCv76zw/+0m+lyzeDMN6Vk6xWMZOBGPjQq2NP1sOI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jTXtgLCHwdUX7M0cD6LPPragmnzyNdqbNHsrgWh5rp0DBpHFAUVgXRwEMrLeluJDTvCw7OwalHJzkaigtrMGGLNG+g+IRBijLnj/oUQSKYWU9NXrwfMsZHsfYNyszY7wPT1jQYYp7U4ZmEjDYGwqtFhFPweRREPZq83OLARYIQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sQzl7JoK; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745820727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wpJe+SyHKAKA7Xe8eF1jSDRDURs46JvcnTlKUNm/bwk=;
	b=sQzl7JoK0cLUXuqugQG62IMSNmMORsx20yCnA5ShacBmNbg8kcTOwI0sn6YoaMoEDqnONY
	w8b/KEhhP5FhknFVetEmTUajcQR+VLUK7gtMpK98N+bQsTKPpNHbv94ZXKeJi3NuM37VMz
	jYeGjUJ0gnxSu2AcvWMsxaSGyZDcHC8=
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH v3] MIPS: Fix MAX_REG_OFFSET
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <alpine.DEB.2.21.2504280233460.31828@angie.orcam.me.uk>
Date: Mon, 28 Apr 2025 08:11:54 +0200
Cc: Oleg Nesterov <oleg@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <D9B3A1C9-5E85-438A-86A7-6FFC3E7BCC67@linux.dev>
References: <20250427113423.67040-2-thorsten.blum@linux.dev>
 <alpine.DEB.2.21.2504280233460.31828@angie.orcam.me.uk>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
X-Migadu-Flow: FLOW_OUT

On 28. Apr 2025, at 03:35, Maciej W. Rozycki wrote:
> On Sun, 27 Apr 2025, Thorsten Blum wrote:
>> Fix MAX_REG_OFFSET to point to the last register in 'pt_regs' and not to
>> the marker itself, which could allow regs_get_register() to return an
>> invalid offset.
>> 
>> Fixes: 40e084a506eb ("MIPS: Add uprobes support.")
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
>> Compile-tested only.
>> 
>> Changes in v2:
>> - Fix MAX_REG_OFFSET as suggested by Maciej (thanks!)
> 
> You're welcome; please add a `Suggested-by' tag accordingly.

Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>


