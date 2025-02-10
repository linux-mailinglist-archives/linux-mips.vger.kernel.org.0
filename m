Return-Path: <linux-mips+bounces-7722-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 097A4A2F535
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2025 18:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71AA4188A5AD
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2025 17:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D2224BD0C;
	Mon, 10 Feb 2025 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nv1DEaqX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB3D256C6B;
	Mon, 10 Feb 2025 17:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208406; cv=none; b=cAWZ5cU6aDZQv0b1Oqu5Kis7AlHz9sWElr+gB5Vw8guwWgme+RUtTWymMB/1u7Ad30pLvu3kTpT9vWFsa7rV+QPU9vPvq4/c14CX5b6Rwk8kBvcoLZ7uHHwZF/tykzUNm7QpEicyepJIX2ETq0aw5Ol8ieiS+rqZ7CTW5B+c3Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208406; c=relaxed/simple;
	bh=dFdEHV64PvXwM88HiXG36orj35kREPl+pEZLrcC9Wik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WndOxaRl8ibouwZZjoLvF9CqTyyZFsLEt0cES/UCSpjrvgLm+prlbwsCGWkNOvSEo+znLMXgAUDxwXshJj/0LrM5i16UK1co+Of/+7ozt2noszlE8BqCIBqs5m8LA75pWFRyOVbFUa841a3zDLDsiHZFmeTobYqh31Clcv7ok9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nv1DEaqX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0538C4CEE5;
	Mon, 10 Feb 2025 17:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208405;
	bh=dFdEHV64PvXwM88HiXG36orj35kREPl+pEZLrcC9Wik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nv1DEaqXgCu7T95cZlvPA1HzDZyY0C8Qb280GPlm4LSzoC6CTwRBjetDPxF6rJk8P
	 tAtMaioVFv/UacMfiAXJfUNBYJGMmik1IJ1TL+1XRVqH3i2wK3vtH1okBWXn4GKUDD
	 /iOKDjBZuaOC+Mf9GKQRK4AtGBUTp04R4KuNCB4GJLjdZ+G4QiYzbMooXF0xrJNUPx
	 q38Asjoumb6CtMpzpuvlr+WNUTROHSJEDuvmj7THYwM8F5cbZuWtmv2LLV2Q7vgCrJ
	 IyQlx50dRG/836JAZsxnUfi1/e5oygmotS4G9ax+PuLpdgQhLloJF2VPncr1vlVwi3
	 1ua5yuODlCU5w==
From: Kees Cook <kees@kernel.org>
To: Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 0/4] seccomp: remove the 'sd' argument from __secure_computing()
Date: Mon, 10 Feb 2025 09:26:37 -0800
Message-Id: <173920839501.2521863.14260779876431853606.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128150228.GA15298@redhat.com>
References: <20250128150228.GA15298@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 28 Jan 2025 16:02:28 +0100, Oleg Nesterov wrote:
> Link to v1: https://lore.kernel.org/all/20250120134409.GA21241@redhat.com/
> Only 2/4 was changed, please see interdiff at the end.
> 
> I've included the acks I got on 1/4, 3/4, and 4/4 (thanks!).
> 
> Oleg.
> 
> [...]

Applied to for-next/seccomp, thanks!

[0/4] seccomp: remove the 'sd' argument from __secure_computing()
      https://git.kernel.org/kees/c/1027cd8084bb
[1/4] seccomp/mips: change syscall_trace_enter() to use secure_computing()
      https://git.kernel.org/kees/c/0fe1ebf3f056
[2/4] seccomp: fix the __secure_computing() stub for !HAVE_ARCH_SECCOMP_FILTER
      https://git.kernel.org/kees/c/b37778bec82b
[3/4] seccomp: remove the 'sd' argument from __secure_computing()
      https://git.kernel.org/kees/c/1027cd8084bb
[4/4] seccomp: remove the 'sd' argument from __seccomp_filter()
      https://git.kernel.org/kees/c/e1cec5107c39

Take care,

-- 
Kees Cook


