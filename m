Return-Path: <linux-mips+bounces-9356-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A98F9ADDC8F
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 21:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F8293B84B2
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 19:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6373D1DA617;
	Tue, 17 Jun 2025 19:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NQQzjbOq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BC22DE21D
	for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 19:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750189456; cv=none; b=KY8oXHUbEEqYwfT6EZTu4oBA075/KdAIdur0KQ3WJmMa1k1Q2sGAf2ztGDkgodZDab/Zbzvs/RXBTjS9GhgtDOMNwQNDquFrUrVbX5H+2iILgge5Z/zFjrbguy0SAUUqS543/gtQQf98ocsXeNj0VeVSCn+ZWLum6TJEZ6+sYtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750189456; c=relaxed/simple;
	bh=GglwgC9V6N5x5dY/greRFE2ImYu5s9zU1NI2hHBVjMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0LakuSqAEqEbpVYkqK7mbtuhCa7noHz/jZVGA+DrFrOh1nvZTFEVCxI/e0ZwHYVhnIaPCnqoJBhxgdglE7aQs97Tpi1qsCFjjxAN6boWJ+bIunXwGXfhtFb+jD+HEpIp0VySofxtDv8mlb1DEstC8boUejvXJ9QxZ3ZOaF44Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NQQzjbOq; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso10846664a12.0
        for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 12:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750189452; x=1750794252; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9BlEsfucVc/RasLKZoG4B3LJbpSakOO/+DV6/Nb67hA=;
        b=NQQzjbOqUu+mki5AFz9jfPsnfnR+o0kX+ev1gARHH1+K+lMy4kh7UvyhM78HvjD7JV
         8Vtzis3NDCMBFko2oK3YY8mmGfRBjasjQV3I1pGa5jraKewkxkElu3Wraw8dCPdihibP
         6VkMof1CDemGZF9wL0FX4yEgiusSKWj5RW2Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750189452; x=1750794252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BlEsfucVc/RasLKZoG4B3LJbpSakOO/+DV6/Nb67hA=;
        b=A1F//erZFD69uqTC0Zdb3YUOou9V3qjD+5adods3EoEnYwKkAXaFD9YXAu8ZfAK1Zz
         GEvzKBjOn0JGALrqWhUF1ZdY71/wyXAGHttQa/vl8iiBqDyKXkYYBj4YMqdfLIhBhlHN
         GVDC6h3RbeD+grNpgqoqwps393HFtcs3yapxQSilEtsv41CbZlfmA96s9BuVOLyEfC8T
         GehNo39qPKjeGtUhSHJ08OsYJ/LLXPF+5TeaYO/ZIaRMb+PGmOPbQT+a4fXiDdwCC+Kh
         JtjB4Bx4dGIA+5//Y9ii1Gou5QV3aFSFIbbvrnvpq2h+vpGm18cWzGB244xCIgmiA4MZ
         fB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1Ogm19unEgpdNWfDcV1i9KIfQ7xrfES1LIL/tTiZdXM3HyJmDwGzPG0xWLVfzSA10WxesLhsAxhr6@vger.kernel.org
X-Gm-Message-State: AOJu0YybRIzHAWMNS+DMYDxmAp17WZr1bCEWsMVY9xa931qLcvfHabI/
	+DhGGQArKu65Kod6lCon7gujqJDwayHLoIRFKA+R7QFbqWiFrqclDqRRidMwOZNgHVoGyay2XB6
	99mV9qMc=
X-Gm-Gg: ASbGncswnCmBuFUJ00emXn345/kGL78hhGZIdutJXxwIX1+LOPTHadQ2uljfxO1wbKf
	WfYnj6ovh6i2Q0dFTXNbiT6zPXu3eJhwZvrg3OE8Kxp0CgIk6LfBRp/epSI7SP37E/ogbinfbY8
	YbNKj1m8AGOJ6GgERRKo04+w2iY15vkZp2vKqUeDDMPAsh1rfldncKRzkgygaHoNzIB/093ayQH
	gZ2r/G744uhL05b7rH5Ww7jYYlUl9IQfh+zjW4EXTcMJAG/euxe4G8m/X0RpN2Kjx45sYO8M+Bx
	HrE7f+a4Lh7bkju9jhXw/piuXKk+c+o10LRuwjY37Iw0c8zkgMqePcfEnfvayx3k+RaZhzgeUmb
	pfrGLtQxGg+Z1PERbmU0wr7JmXVuLJnGxTHxh
X-Google-Smtp-Source: AGHT+IHoWUN2BmbI0ZGz80kyxEHO7xqEKXZgcLpFxY+GmaSfEdGSF01eGRNybjF7bzNhwujTga2JjA==
X-Received: by 2002:a05:6402:3592:b0:607:19b6:8cec with SMTP id 4fb4d7f45d1cf-608d099f344mr13585336a12.33.1750189452073;
        Tue, 17 Jun 2025 12:44:12 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e6dbsm8440519a12.51.2025.06.17.12.44.11
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 12:44:11 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so12058267a12.1
        for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 12:44:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCet07Pkyf7LMQ102vznY1UtWW6syPYzPaLgZOLEyr5NXUHtrV7lLbSSIpewWt9Ra6YN+pJ1A7tYGB@vger.kernel.org
X-Received: by 2002:a05:6402:278e:b0:602:29e0:5e2f with SMTP id
 4fb4d7f45d1cf-608d086197cmr14681659a12.10.1750189450991; Tue, 17 Jun 2025
 12:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com> <20250617192212.GA1365424@google.com>
In-Reply-To: <20250617192212.GA1365424@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 12:43:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
X-Gm-Features: AX0GCFszNgSlkg9Mnl9IREDvPmSYgcHDQLiQJ6pRqgmPlre4NTxTJm_9n0SX2DU
Message-ID: <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 12:22, Eric Biggers <ebiggers@kernel.org> wrote:
>>
> The tests are already in their own patches: patches 4 and 5.  Yes, this patchset
> has a negative diffstat once you subtract them.

Yes, the patches were separate, but my point stands.

Let me repeat that part of the email since you seem to have missed it:

> If I see a pull request that only adds new tests, it's a no-brainer.
>
> If I see a pull request that only re-organizes the code and the
> diffstat just just renames with some small updates for new locations,
> it's a no-brainer.
>
> If I see a pull request that does both, it's a pain in the arse,
> because then I need to start to look into individual commits and go
> "which does what".

IOW, I really prefer pull requests to do clearly separate things too
when we're talking re-organization. Or at the very least spell things
out *very* clearly.

Otherwise I have to waste time just to go split things out _anyway_.

            Linus

