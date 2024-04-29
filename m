Return-Path: <linux-mips+bounces-2960-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 805FB8B62D9
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2024 21:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 311051F22206
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2024 19:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698C913CFB8;
	Mon, 29 Apr 2024 19:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nona.1cooldns.com header.i=ghim@nona.1cooldns.com header.b="DuL2K7yt"
X-Original-To: linux-mips@vger.kernel.org
Received: from rdns0.nona.1cooldns.com (rdns0.nona.1cooldns.com [31.192.235.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EE413C697
	for <linux-mips@vger.kernel.org>; Mon, 29 Apr 2024 19:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.192.235.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714420184; cv=none; b=AmFWJRIniWs5Xcu9cu8Xf1XZCqh9mB3n+7Ap9XGQ5vRs8Q2+FD3r2YD6XnA1QZIMSrVyZNw64unlreZEqQv/27PGpIvhPx51u20OchZC1/Mv9c0vdQQx2/svrMisY11ZPQFI/NqKu+qSzZnxfwMFYMkRstTNWBApwokFInaQ/WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714420184; c=relaxed/simple;
	bh=JG0SV9hXY/1TtbjjSQkLyMvYYfN5KWdFuiRFpI+nqE8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=trAaCsv27QCJq29e/VeYVzBkCEqNQvoBxlZuyhJTEXfal2QdVrpzg09W5IKSm7VOWOdQAjZ3C3hhXnyywPIfK7XNCAZ434OJCJ5uyTN1+CY6e0of4+o7pDhw68jhiBOVr9iVGTOHgQ4nUT+JocXi4h5in3KV1QsRTeH+gfGYM/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=nona.1cooldns.com; spf=pass smtp.mailfrom=nona.1cooldns.com; dkim=pass (1024-bit key) header.d=nona.1cooldns.com header.i=ghim@nona.1cooldns.com header.b=DuL2K7yt; arc=none smtp.client-ip=31.192.235.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=nona.1cooldns.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nona.1cooldns.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=nona.1cooldns.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=ghim@nona.1cooldns.com;
 bh=JG0SV9hXY/1TtbjjSQkLyMvYYfN5KWdFuiRFpI+nqE8=;
 b=DuL2K7yt3RCSKLxWjvBmQhXKs8Br7LlRe9zqqiKeZhSfffn+b3V+3vm2XRQ9XpxsCxcHD/tuXsil
   NeZ4TlXVBixvKS4oVGHcUN0xuhA1oFKjDOgfmK3R+4JWmEKhhHvG9lElDhvOxVyWv0QxCw0fZpRw
   T5yiJqc/HpeCHAR0Krw=
Reply-To: stanislav.marcel@aliancegroup-se.com
From: "Support" <ghim@nona.1cooldns.com>
To: linux-mips@vger.kernel.org
Subject: request for quote from sweden
Date: 30 Apr 2024 05:49:37 +1000
Message-ID: <20240430054937.E277C93CB6048145@nona.1cooldns.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

My name is Stanislav Head of Department, purchase. We would
like to know if you export to Sweden, as we need some of your
products for our client, kindly gives us a reply so we can send
you the full specifications and details of what we would like to
purchase.


We would appreciate your prompt attention to this request, as we
should begin a cooperation as soon as possible.


thanks & best regards.


Sten Arnlund

Purchase Manager
stanislav.marcel@aliancegrup-se.com


a: Veddige by 2, Holmerskulle, 432 68 Sweden.

