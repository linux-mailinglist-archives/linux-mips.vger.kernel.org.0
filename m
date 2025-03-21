Return-Path: <linux-mips+bounces-8252-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CB3A6B8FF
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 11:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C43D33A8B70
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 10:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4652217719;
	Fri, 21 Mar 2025 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IwMMzdsk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EA44431
	for <linux-mips@vger.kernel.org>; Fri, 21 Mar 2025 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742553864; cv=none; b=hYxUNie1a9SOA1sQWy2/x8d1uHdDTJF62Z7TOZem0GPyTQy9oLtwvcUYHPtad4KyMmdS1X9zV2QLqzZoKsgyVHElk03ceAtqVgr0FM3V+n8dD4Zeif4sUvXX8YoyPovgOQ6YWKjfSsDLe/Y4k5nGi6QWvdQUvsc/ZZuWJ8Ycz7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742553864; c=relaxed/simple;
	bh=SCjwz9IhNUs13zrxYy4dhDI/gNy5VGZmAA7bVjTjQqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbKt61n5B10phPiNvQ+YrGSw+3JnfQzkbt1U6lfbgPku2+MmAs+jNemL13q9cJCF3iobGIlKQolSfMg2ZHOVxiEHP3yKthHIJ3ZlixCZttGUA/DwKxZMrTNbwQqRmHPW4DY6FUggxV+mhsvqoHQTk+65WVp8pAG4UAHzEONMz3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IwMMzdsk; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54991d85f99so3110971e87.1
        for <linux-mips@vger.kernel.org>; Fri, 21 Mar 2025 03:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742553861; x=1743158661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMFQ6ixjFyQ1E4NstCe9/IuCPeD7EZepvZAYFGPOnbE=;
        b=IwMMzdska1joh2w14YzAi7dXYywdfWPUpgVmERH1bWtIKp+29whHGTsrGEgFxEOwS9
         SXRJNIfdulzb0m44VTDNf/r2sAapXRoBh80nRjLJOMAVx9mr2RZNTf9kgysBp/38XkPE
         78ceeA+5+SASJHpLZ+cqUct/Y9rbAnpvnWUMCBxylldq1gWbdACgG5R+k90UXM6M94OH
         BA14xqsPmirQr5SiT8EeKuLyJNw6ewWCLPB/SBjrOCyDwSboS9LJx+nVi3Huny5brRke
         R4cLhYJsSaA9nu/pjWF6kFRdXnUmVFl7TnkBjzbtiQC67xErTAvscv8t7l+lp1MFN6kC
         U7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742553861; x=1743158661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMFQ6ixjFyQ1E4NstCe9/IuCPeD7EZepvZAYFGPOnbE=;
        b=RIejBG7q1hy7VGmHeVC3ntVAIWm577jOcrcJrc4Mwz8VcMaxJqoycjupNUMClB0haN
         oEUEE73WMSf8yYPfykI58rsYONKS40e1bL0EyOV+zuiIyNN4GKo3rhzpfHRpa74KhNQ9
         kDWJHssO5zbp+LPOvEQZwihqw87WGzdGKbFbOhCisVe2opiSzTrOYsKFoRmKS4MWKoXg
         hst5nq7zcofU7Nh6wG8LihvGtGna+snkYbX7Rl7FQWdmW1IR9cSnlkbCTVeoef8ctKd4
         GUxhiakbJsMYwe8N1MGhEta76o6Ar/Z3e+pKKGKHBM210NAa6Iu3TUXi8nAjNWLbJ0lu
         YyZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaIFGRwPJh3VxpKHaOgMs3l7s4hfVfkWlafopsGUwPwBIjwAzMhePTxbfUE85j9siY5l380Pa4HFMP@vger.kernel.org
X-Gm-Message-State: AOJu0YxQqOdab6SckJj6rtyUKoqX7ZsV4GJby0XieyDrWFmMmHyFbYEa
	Q4UkhB82mBV7pwdGp5pSFtZTCInLLoycFft9GAnCjTlx0kJpQW+eFzQAuA8p0q0lAxTrJDf9W4B
	4KK79PKD9tbdQxmUcLdLSTqJLss6HbQ5xxgPVr3oZE3zW7rQP144=
X-Gm-Gg: ASbGnctJ6riaSDWVvbsNpmpr8F49PYUabG4Wnq8U3d6/bNIAGmNif3mNvouPCzTen08
	c83uOPBroIRZJWLrTtoM1WqyuLL4ktsfmYH5sfSXQqK4koe4E8hy2Gk2DqWzxKxvMi89cJ3E5fD
	GR5SCAoFXQNdZU0zuux/nv8lbbaXkEDT6Sql0XtGSFB9ViCpCfGvCtyWPuq+n57hCIi/R6Dw==
X-Google-Smtp-Source: AGHT+IExWP4rEZzEIQLvGfgn1PTsgmb75s5NHEvjlqVUG7ZMsU4G9wMoNJQZ7haUyid3P3yrJgHTnRHlG9abuUhqmzM=
X-Received: by 2002:a05:6512:220b:b0:54a:cc10:595e with SMTP id
 2adb3069b0e04-54acfa79a96mr2319677e87.2.1742553860747; Fri, 21 Mar 2025
 03:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com> <Z9qlW81QikxeVzQa@alpha.franken.de>
 <Z9rYAT9i3Ko92uUo@p200300d06f3e987545685175b554ae65.dip0.t-ipconnect.de>
 <Z9rjZf0ZT7iejVlA@alpha.franken.de> <CAAofZF7XPm+tzPpwAPu0oDZem+EOVY18oAbVwAXzkGmtstnBQg@mail.gmail.com>
 <Z90zebpJE4Y9SbkK@alpha.franken.de>
In-Reply-To: <Z90zebpJE4Y9SbkK@alpha.franken.de>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 21 Mar 2025 11:44:10 +0100
X-Gm-Features: AQ5f1JpOKBazK8g4BWMOjvBQWA4qXGIWYXKI1lSJvQLrZC8sT_FrUCOZyJuIkFw
Message-ID: <CAAofZF50P0+c6QbNxzEunwbDGUZEZpKM8wa2dBYXAVFFYGq-hA@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Frederic Weisbecker <frederic@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Huacai Chen <chenhuacai@kernel.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 10:38=E2=80=AFAM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> do we really need that for a symbol local to that file ?

Not really, I can use the label directly.

On Fri, Mar 21, 2025 at 10:38=E2=80=AFAM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> > +       /* Check idle interrupt region size. */
> > +       .ifne   __r4k_wait_exit - __r4k_wait - 36
>
> I have to say, that I prefer my .if statement, since this clearly spells =
out
> the comparision in the expression. Is there a reason for your version ?

Sure, let's keep your version.
Can we use the "error" message above? (""Idle interrupt region size
mismatch: expected 36 bytes."").
Or at least something similar, I think it is easier to understand the
reason for the error. What do you think?

Thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com

