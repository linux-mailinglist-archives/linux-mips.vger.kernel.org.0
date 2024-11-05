Return-Path: <linux-mips+bounces-6665-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 649D69BC232
	for <lists+linux-mips@lfdr.de>; Tue,  5 Nov 2024 01:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3327B215D1
	for <lists+linux-mips@lfdr.de>; Tue,  5 Nov 2024 00:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B943618EAB;
	Tue,  5 Nov 2024 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vRQB9j4l"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D772F9DF
	for <linux-mips@vger.kernel.org>; Tue,  5 Nov 2024 00:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730767883; cv=none; b=OnTtEkKbLwyzygPDWWrz0YEwJ/0GWqSNURe94btFoAMGluQk6/eAHnEzGcTm+sQuV6xAbqkT1JZP/SJ6ZaSiz5haEYxcoV15kgx/QmwKgWktp4ldXa4/wwWVRduwqc0r/MTHISjuNBUivPWix9ggyN1LPM3o4oDwaT428CRVBp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730767883; c=relaxed/simple;
	bh=qsRaukKKrdtSkAST308wPBqvq9LNUvMluUMqKWn1pmA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=a9OQtd+GxQQl64RfnwHiw8SD3P8tAzbgcFJjK5w4TpxfOFh2PupPNxol5Ho1SnF4nRFpsEeih81kThnkCQK2DESr75oA2+Kst4NYq9ywARSLTW5kvMFmkr15hRFJJ7URWuRz+44xtviXool4FskQ15me5jSMPVBBDxL1Kp9jEEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vRQB9j4l; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730767870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+UKCB4fnJE7P2wptGFsMdugCrAOnpjE5RGivFbdLh6Y=;
	b=vRQB9j4lYkersYex6ROrwaK1BDBfdQLkdbg4CFvcvXQjiwoSSnI+HqtJcXsXBlGo1sO6QG
	iB2wcbhUu/qcwNPj8LPpv2HOtMojMNaSjwT5F4+SLHub10Rah6rGroJ1S28JVgM7RBI0r0
	rYl64wpdLRUuXv3bQTOLNHZ1F+C+hvg=
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] MIPS: kernel: proc: Use str_yes_no() helper function
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <alpine.DEB.2.21.2411042349440.9262@angie.orcam.me.uk>
Date: Tue, 5 Nov 2024 01:40:00 +0100
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <D3FF9278-BF88-4B9F-AA8C-4EAB6B353829@linux.dev>
References: <20241102220437.22480-2-thorsten.blum@linux.dev>
 <alpine.DEB.2.21.2411031921020.9262@angie.orcam.me.uk>
 <F2FC5695-440E-4A29-B683-4335452F6FAB@linux.dev>
 <alpine.DEB.2.21.2411042349440.9262@angie.orcam.me.uk>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
X-Migadu-Flow: FLOW_OUT

On 5. Nov 2024, at 00:51, Maciej W. Rozycki wrote:
> On Tue, 5 Nov 2024, Thorsten Blum wrote:
>> 
>> What about the comma and newline? Using str_yes_no() would remove them.
> 
> This is why a minor code restructuring is needed so that the comma and 
> the new line are produced elsewhere (arguably a cleaner structure anyway).

Ok, I'll submit a v2.

Thanks,
Thorsten

