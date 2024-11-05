Return-Path: <linux-mips+bounces-6675-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDA59BD3C6
	for <lists+linux-mips@lfdr.de>; Tue,  5 Nov 2024 18:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8177B22CCE
	for <lists+linux-mips@lfdr.de>; Tue,  5 Nov 2024 17:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525EF1E5005;
	Tue,  5 Nov 2024 17:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o3jY++jt"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AEA1D9A7F
	for <linux-mips@vger.kernel.org>; Tue,  5 Nov 2024 17:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730829101; cv=none; b=vAL4xd6isvl84UW08BUMIghBjaqBXTM/CYXcuweTWFpak2YYLINkj4noPelmY+V/m50v0/ti7w4SZJsMyBU28UzFcSQlguKdDwNnJU//XBxNFhaNFeeX6wgtqdaB9//2kCyaXYRF8kl7p5J2axFq/ejUE93S3UA9lpZjqaRcACM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730829101; c=relaxed/simple;
	bh=7lmSXDRKJMQdY1Z4f2o/KhF3n98hCCcnTqWt6A9sbCQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Yn7ndyBxd+wR58HbR61mjoTYEITG+YGHsMsqgmp/KYYwVs49uFeYJOlHDu+o6J1sSBvKR7KTioDuGBOQnXJdrJc79JsWZFvHYuUP2ui0BC+N5kJ8xviOzLrVDWrcRPYKoPdxxRRS2+pGKQXGBNZ4qlA7/7LlDQJ/C94Oiy177Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o3jY++jt; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730829096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5ayEpY8lK9Ig40T1/Knqdv6m4Esh+bt7IqsSYjFeR0=;
	b=o3jY++jt7fdW/8sUbPUqF/aq8pbmYptQJ43sAhz78uW+5AiANsVl6LAdvfhwRNnfhutV6O
	wGH5dtQS2SAIECP6/iDcQIv58cUW06D1QFYmijQm6pxsTUp43HKN+SvzboYKZ+kU/8B6TX
	EvNAm48wN8Gz75KgfW2ON5l1zr26hao=
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH v2] MIPS: kernel: proc: Use str_yes_no() helper function
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <20241105173837.37756-2-thorsten.blum@linux.dev>
Date: Tue, 5 Nov 2024 18:51:23 +0100
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <AB524950-2672-406F-9141-28CE0A074181@linux.dev>
References: <20241105173837.37756-2-thorsten.blum@linux.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Migadu-Flow: FLOW_OUT

On 5. Nov 2024, at 18:38, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_yes_no() helper function.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Forgot the link to v1:

https://lore.kernel.org/r/20241102220437.22480-2-thorsten.blum@linux.dev/

And I just noticed the use of seq_printf(m,) vs. seq_puts(m,) and I'm
not sure this is still correct. Have to check this again later.

Sorry for the noise.

