Return-Path: <linux-mips+bounces-12655-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D30CEC000
	for <lists+linux-mips@lfdr.de>; Wed, 31 Dec 2025 13:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E4823009F92
	for <lists+linux-mips@lfdr.de>; Wed, 31 Dec 2025 12:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45E7314B77;
	Wed, 31 Dec 2025 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="jl1TY5nj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0446D24A046;
	Wed, 31 Dec 2025 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767185032; cv=none; b=ChxvwHXiJz+Ki+fGgVpXs+ooczu4jFaa7v+F1c/XfxaSWA9oNdJBDgzXYCMlaGWt24OgAAHXJksjyuE1yoaldkP8quYpq1osD5FU2yX6+ptLLkCoYeLcN250IN/c1ji0l5ibnxD0li8JemG2PZ1L7YU2go5MsxCs3oanfLB9tHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767185032; c=relaxed/simple;
	bh=dEhQpMsPCVwotTFTae/WubHmXa2WQBBzYVtdZc3TZ+M=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=l51/q4282TGUyQXr6TUqBQntI9TpG+CWA0+Z/o3AsATPKMcyBeZHrrQ36A+N6Q+dWvGDkF22pbjBXzxU6x3Nu6rUAA+EmSFW6lo2J4qgpEhMT6NRgKklBqa+CN/a0ViTt/EG0KFhC0CRgj1SZNWnUjx1jaWDBX0kF2OW3agVHps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=jl1TY5nj; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767185024; x=1767789824;
	i=markus.stockhausen@gmx.de;
	bh=dEhQpMsPCVwotTFTae/WubHmXa2WQBBzYVtdZc3TZ+M=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jl1TY5njcMeEzXSUlYL/bNu0N3GvgkBvX7N32dR2LK415Tbw+SxYna2gqVdyJ2JS
	 DXYdpzz4dLzORA3lJNA4KypNMXo+rsouTXbAphehNzJ4kQBivNfPQGTyQevUisfZf
	 ZnQAiP6tASwe9aWs/0kICPBBUkItziB+ThXcMex06499/UAdrEti9wi7ortEskW+q
	 MMdRBiyCQ+quVZAwNOhB7R1AtPhaPDGnKly+/TOFLunT7WW4CJGQ4x3kACnD78NMC
	 pdgj0BGjZl0RQG+tchKJBVYhXEZKemFtrI1tZGTLHbqc9vNA99p2xdvD4j8LmcRT7
	 kEkXhdPex8TxhIpWIw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.93.28]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmlTC-1wIY5h3V9K-00kS7W; Wed, 31
 Dec 2025 13:43:43 +0100
From: <markus.stockhausen@gmx.de>
To: "'Mike Rapoport'" <rppt@kernel.org>,
	"'Thomas Bogendoerfer'" <tsbogend@alpha.franken.de>
Cc: "'Andrew Morton'" <akpm@linux-foundation.org>,
	"'Chris Packham'" <Chris.Packham@alliedtelesis.co.nz>,
	"'Thomas Gleixner'" <tglx@linutronix.de>,
	<hauke@hauke-m.de>,
	<jelonek.jonas@gmail.com>,
	<linux-mips@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>
References: <20251231105701.519711-1-rppt@kernel.org>
In-Reply-To: <20251231105701.519711-1-rppt@kernel.org>
Subject: AW: [PATCH] mips: fix HIGHMEM initialization
Date: Wed, 31 Dec 2025 13:43:41 +0100
Message-ID: <010f01dc7a53$1906e9f0$4b14bdd0$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFbU2A2go5FJtG2va65UoMCofaSGLY9/u2A
Content-Language: de
X-Provags-ID: V03:K1:wwFhKEUocOJ6FCHJ7aKv9Y4avZFmC2ueczsXeDWPicyBUwYiyQO
 ofU8yeVjTFk2d3dbeEgP9IgDFrtngRt9D/vhliIvum/O7SQFhfqItwWaRFgiZ3HBpFs2rdr
 zMCnmIzyJS9j5hcX0xxZjQIO7a0Tfy9E6E6Ls/UNNPg2ZY9xdEF3Z+v4iDj7rh6lRiThcvm
 e6U7Apn2hG2+oFyBGt8lA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sbfn/S1eGzQ=;5ljjIn35YIU7y3TMdf5amfKIwUX
 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

Hi Mike,=20

> Von: Mike Rapoport <rppt@kernel.org>=20
> Betreff: [PATCH] mips: fix HIGHMEM initialization
>
> Commit 6faea3422e3b ("arch, mm: streamline HIGHMEM freeing") overzealous=
ly
> removed mem_init_free_highmem() function that beside freeing high memory
> pages checked for CPU support for high memory as a prerequisite.

Ah, that gives a little insight to the issue.

Thanks for the patch.

Markus


