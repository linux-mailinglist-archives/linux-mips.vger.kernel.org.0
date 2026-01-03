Return-Path: <linux-mips+bounces-12721-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC282CEF9FA
	for <lists+linux-mips@lfdr.de>; Sat, 03 Jan 2026 02:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D985B3020342
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 01:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEC521D599;
	Sat,  3 Jan 2026 01:26:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559BD21D5B0;
	Sat,  3 Jan 2026 01:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767403600; cv=none; b=rFMVokAngaa7i0uEybJgfBcBw8kq5mYqZo0USFbwea7X1XJgphybuv+MlvgCGSTcYNbMjrHGn0kJqKcLYMuGVoUYyaNAfCk+azjummvtoyARjI5FibHkdTPIYL003POVx8NqgMv7OBj1Bk6UHKV/4K6EtqHkh1MwW0iV7AVQhHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767403600; c=relaxed/simple;
	bh=g7C19Gcc47fy4Al7LDB9byLW9jUaz5PM6hUTmEh4SGQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=svs3LRzK6+lHf8T99dsfe89wyrjsu2mVW5VDPWZMGyKtAqjHw9lAIp604m75QVqCYzjyeOpLHCtbO3DpHmszeQ8+l6xrMeF6+zL0dJBtjClP56Intw1yKlYE4l9qvFxuGcB4Il/xqeFA6ksCuC0hx2FGTSRaggwYoudLciInpK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id D541E92009C; Sat,  3 Jan 2026 02:26:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id CFBC392009B;
	Sat,  3 Jan 2026 01:26:28 +0000 (GMT)
Date: Sat, 3 Jan 2026 01:26:28 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Randy Dunlap <rdunlap@infradead.org>
cc: linux-kernel@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: LOONGSON32: drop a dangling Kconfig symbol
In-Reply-To: <20251228190443.2479978-1-rdunlap@infradead.org>
Message-ID: <alpine.DEB.2.21.2601030126020.14570@angie.orcam.me.uk>
References: <20251228190443.2479978-1-rdunlap@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 28 Dec 2025, Randy Dunlap wrote:

> CPU_GAS_LOAD_STORE_LR is not used anywhere in the kernel sources,

s/CPU_GAS_LOAD_STORE_LR/CPU_HAS_LOAD_STORE_LR/

  Maciej

