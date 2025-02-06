Return-Path: <linux-mips+bounces-7707-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B802A2ACE2
	for <lists+linux-mips@lfdr.de>; Thu,  6 Feb 2025 16:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE4CE3A9492
	for <lists+linux-mips@lfdr.de>; Thu,  6 Feb 2025 15:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5123724633B;
	Thu,  6 Feb 2025 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWo1Xryo"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5AF246339;
	Thu,  6 Feb 2025 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856564; cv=none; b=QrPkZlmz9/UFbMHFwnRcljnz76HBb5IvgSwxhAf+pOV7slwtBIlLjn7CLGubKW3uftW4rDViPcsLSe2QTUHFJ9lkjp8NRWhqCZ2oR3fYjOa5bmB6xbFj445xDX7WaC/m6r8RtNQNrct3PQhq2eA3tOnm8BgFNhDyMHv+4V8hcCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856564; c=relaxed/simple;
	bh=5+FTDlmQWovIleUiA1q3Ejj7y/6w0GAkmYeDjxkywuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uN1Ixfv/+vAvQ5CkxlZGcGjiGQJM+ss9z573M/LohG84xRhi9sO5pImb5BprYfI24wrOwRCOUsx/ldhYI/vfW5gq5kozpPG3iS7lH27HgQvqkLLG3hJ5CldTKG+I61AddVvcPVAJbqqHblgTm0fPumFZTvmytCGwLpOVMi5DtAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWo1Xryo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACEDC4CEDF;
	Thu,  6 Feb 2025 15:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738856563;
	bh=5+FTDlmQWovIleUiA1q3Ejj7y/6w0GAkmYeDjxkywuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qWo1XryojRSFF9wT8B7l4iOecPgHYZ7k5Ae2GLEIa0/ihek84O+EkuT1S1pqAzVDv
	 0k38KtKYCeoauKmS7ue4uwAi21xOrY58QoogK6BQQfQuSkiWQKtcsa8KPV5ShDbKYF
	 yResPzeAXpbUr5HnAt9WHoVqnRO+BVuLfoXwGW+KtluQ2Ipgu2QZyQXezBdjyJfJ9Y
	 mF4cODLjdNx0HB/1O9g0PNoCMJAOpUKxcJe7MyWpjVWT9xDXsFxeFylps/Lds9q3b8
	 GBemcQoPVLHTlgD2kQjMeLjuTRM1oS+9Z65kphdSaIpwR5yNL6lCDBE8Ch6moXsH/I
	 Tn2tm3drx5/eg==
From: Kees Cook <kees@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"Eric W. Biederman" <ebiederm@xmission.com>
Cc: Kees Cook <kees@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Michael Cree <mcree@orcon.net.nz>,
	Sam James <sam@gentoo.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
	Chris Hofstaedtler <zeha@debian.org>,
	util-linux@vger.kernel.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v2] alpha/elf: Fix misc/setarch test of util-linux by removing 32bit support
Date: Thu,  6 Feb 2025 07:42:32 -0800
Message-Id: <173885655037.1454207.17881331998395742818.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87y0zfs26i.fsf_-_@email.froward.int.ebiederm.org>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de> <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com> <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com> <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de> <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com> <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de> <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org> <2758fa70d237ff972b0c8d7114777dc4a20c8f3b.camel@physik.fu-berlin.de> <alpine.DEB.2.21.2501120146480.18889@angie.orcam.me.uk> <78f3ae1f68842a9d1af62caaac3929834ce6ecfa.camel@physik.fu-berlin.de> <87y0zfs26i.fsf_-_@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 12 Jan 2025 23:39:01 -0600, Eric W. Biederman wrote:
> Richard Henderson <richard.henderson@linaro.org> writes[1]:
> 
> > There was a Spec benchmark (I forget which) which was memory bound and ran
> > twice as fast with 32-bit pointers.
> >
> > I copied the idea from DEC to the ELF abi, but never did all the other work
> > to allow the toolchain to take advantage.
> >
> > Amusingly, a later Spec changed the benchmark data sets to not fit into a
> > 32-bit address space, specifically because of this.
> >
> > I expect one could delete the ELF bit and personality and no one would
> > notice. Not even the 10 remaining Alpha users.
> 
> [...]

Applied to for-next/topic/execve/core, thanks!

[1/1] alpha/elf: Fix misc/setarch test of util-linux by removing 32bit support
      https://git.kernel.org/kees/c/b029628be267

Take care,

-- 
Kees Cook


