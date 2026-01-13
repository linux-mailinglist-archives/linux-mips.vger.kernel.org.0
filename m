Return-Path: <linux-mips+bounces-12890-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DCAD17650
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 09:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0E7C3008FB7
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 08:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD7236CDFA;
	Tue, 13 Jan 2026 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CM3Gevkx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3495436CDE0;
	Tue, 13 Jan 2026 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768294425; cv=none; b=M7ZK8lMzo7Akmh2W7V2fpJAsKPQMPNeDsNby6Y9rb3URKAkXMk6pXpDjFqgABC3kKVG+mkmR/INWIua20SEm0Ir2geNV5s6qCkkEThCyz0nmCOVzykyn9TDhwg4OQZ9riDHRku+/eXxuU1qMtZjjsJPen0dsgJzkLhaBrVs5+uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768294425; c=relaxed/simple;
	bh=9pfiMesqQXjqKUecQNr9FPS5660rFim3R+3vjBnZG4I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z2jX8mkI5ShsmHpLwJFPtErVLb6d+vNEH8r2YHAj6nV+ZWufHVMbunyXKGWymEvkxTa3CHN2pL+QEngkcyvJqIgUTcbq2C1NE5wa0uN589+Zmk+bOdeiu7kV+BUTAgXN8TTBV7QFfSAUxUUejFjYgh/HOayV3QFzHHtpt1N8UvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CM3Gevkx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DCFC116C6;
	Tue, 13 Jan 2026 08:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768294425;
	bh=9pfiMesqQXjqKUecQNr9FPS5660rFim3R+3vjBnZG4I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CM3GevkxBYWAkvyhEWU0EgA0BmlRbJiOUe+K5sughtYkXmljPmzeH+dVlqRjyp/te
	 PiIMU3v+/WV1EzwwyzorQz2QPGYEquAogNkSpc0y2mnH4l3t4+u3EyHAYf0A89WuzX
	 y/gqn/V3yb7jo1MkvoWXMS86LdRCHPRGgYq/0VhleMKHuQN924MlBSldo0unu0Jxo2
	 RYbk/TyQs7ZFgPEct0n4H5E7ur3QNZ//5ZV16PXiBJx3WUVUhUJ5O+1zPBmoZ7zfVp
	 KaXS7eLqVsrt/HW2GGOFiP4OSgO4w77KSYYM2L2Si8ChpydI+uxEJ09/iz0RNSnqAA
	 eHfyFuBBTzRTQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Brian Masney <bmasney@redhat.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Masney
 <bmasney@redhat.com>
Subject: Re: [PATCH v2 08/16] irqchip/irq-pic32-evic: update include to use
 pic32.h from platform_data
In-Reply-To: <20260112-mips-pic32-header-move-v2-8-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
 <20260112-mips-pic32-header-move-v2-8-927d516b1ff9@redhat.com>
Date: Tue, 13 Jan 2026 09:53:41 +0100
Message-ID: <877btlgaga.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jan 12 2026 at 17:48, Brian Masney wrote:

> Use the linux/platform_data/pic32.h include instead of
> asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> is in preparation for allowing some drivers to be compiled on other
> architectures with COMPILE_TEST enabled.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Thomas Gleixner <tglx@kernel.org>

