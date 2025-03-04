Return-Path: <linux-mips+bounces-8084-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADDA4EE29
	for <lists+linux-mips@lfdr.de>; Tue,  4 Mar 2025 21:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29FB7189002A
	for <lists+linux-mips@lfdr.de>; Tue,  4 Mar 2025 20:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0A11C84D7;
	Tue,  4 Mar 2025 20:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASNENR2R"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36C92E3377;
	Tue,  4 Mar 2025 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741119353; cv=none; b=jJ+BR57MuNRfgieePv7gw2l/s43dvMDDvcAuVMN1PqYrYrcjzwpSL9sPQJVQHgtrohXhLA/XzAmZNEKxurEEDEeskuz7C2aJZuGKuad0+gaR+53R5toT3xrz/4Q6YZck2eL9VLtOThjAaV9Rw7wYLJiNM1i9cPBtT3mNSBQ+r0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741119353; c=relaxed/simple;
	bh=EzFptwTINkfYG+DcWRwgY4GYdP9O7yNvF8WI4pbLJoQ=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=CZQdxV86gwgPCGXVnBO/GREVVNG3Qsz5J3dM+j5YknwhC9mOQ0muEnpiKgOOnWlpEmHdANtYJj7OhpJXultpm/4bU05R/Wc/EszFyprVHupF6IF+Z7aLWuVBrfvfusa7+t4UgvqqQ3KFHgnYfbCKKV8EpckaO5sxxtY+mAkURj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASNENR2R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38812C4CEE5;
	Tue,  4 Mar 2025 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741119353;
	bh=EzFptwTINkfYG+DcWRwgY4GYdP9O7yNvF8WI4pbLJoQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ASNENR2RSAj70LmPomP8fllYqSbDjB67zBcNWL5S8kSsJuHIkgl/h/D5qs3X/PerE
	 Ts0Xj0kk0Ngb5fouOYfSbWFG8G8abh0f46YQzW/kALWEnbXKfbEMat9h4OUKAtaaUk
	 v9fOYtrHLjZBVVm4CdWsjG5I4cRC9z7rSn6zVYR3L0lizWzW33I4B4MUvmq7XK0mIJ
	 IcW8D++FlMrsGvIIkkXivrGJkyxy8Nsy0/bjMq6GOVP+B/CsLFNDL/x8Yx0HDtTlh/
	 MwlsfRZETh0VyLVEWZc+TjHb8XOrPnD0Kzj0GonvQWX7xRwRUw3D9/W7CoYGGxBR6g
	 eNmBh3ye0hloA==
Message-ID: <0f84822c35d20c99921242d0d64fa89f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240412090749.15392-1-onkarnath.1@samsung.com>
References: <CGME20240412090801epcas5p1beb5c87f7582cf4f53c245a642468763@epcas5p1.samsung.com> <20240412090749.15392-1-onkarnath.1@samsung.com>
Subject: Re: [PATCH v2 1/1] clk: imgtec: use %pe for better readability of errors while printing
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, r.thapliyal@samsung.com, maninder1.s@samsung.com, Onkarnath <onkarnath.1@samsung.com>
To: Onkarnarth <onkarnath.1@samsung.com>, mturquette@baylibre.com, paulburton@kernel.org
Date: Tue, 04 Mar 2025 12:15:50 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Onkarnarth (2024-04-12 02:07:49)
> From: Onkarnath <onkarnath.1@samsung.com>
>=20
> instead of printing errros as a number(%ld), it's better to print in stri=
ng
> format for better readability of logs.
>=20
> Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
> ---

Applied to clk-next

