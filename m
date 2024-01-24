Return-Path: <linux-mips+bounces-1127-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1179583B44C
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jan 2024 22:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A104F286BA6
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jan 2024 21:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C431353F6;
	Wed, 24 Jan 2024 21:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Rhgvatcv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1010D131757
	for <linux-mips@vger.kernel.org>; Wed, 24 Jan 2024 21:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706133296; cv=none; b=pk/IQuYRT1lhJ7aMa6ofEdwnDaAMO4mnKU87V5ZS5txmxyyd17ONnclBCGfjsbCFp7Gp03hXj6gPjmpAgYMVAvRTBJiiEybq4B1W9C7aAm+r8jQEeMB6QMGNSRBG2odGIJZyxkF7Bb7XsOW0J59MdEGP3ci+FuumbbqAe8SVxAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706133296; c=relaxed/simple;
	bh=oc1lZj/Tvpz8f0+Va0OB/RbD+89WY+TKLfsWPUxPCf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrCAripbHsIPhoLIVPKtJBbIT+gnfmFmVPL476Q7OMFyLrsfQCw2iHa4kt2r5K0ka3IGSImXXOsnzgtAq7rFQp9dPsBPwUO4e2E3A1eWXIwbiY3ebJcLUbesydtV8Yr/7nPHR8AhPjcDIFynepwcePrSoyKnC2YjTlcoIPWeQG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Rhgvatcv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a26f73732c5so675785366b.3
        for <linux-mips@vger.kernel.org>; Wed, 24 Jan 2024 13:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706133292; x=1706738092; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uzk/NXIbOmouCEogp9S9WiRLOAXkHbEQwd7DHqsoqDY=;
        b=Rhgvatcv8M9UY4CK+IBjAahK0+xaj8YPjh+qNhKpsgt3PQ6O3hHTvUrpvtOqD3DZKc
         6qmfKWJTA2DPLk52BoY05p7qzXacgyNNHU8Bnx3HWjIn2nEi9asx+e1hc0ZlUqM7AQxY
         tbT8z/WqnJOLROFkoJsoKpsgOZuxbvyCac4Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706133292; x=1706738092;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzk/NXIbOmouCEogp9S9WiRLOAXkHbEQwd7DHqsoqDY=;
        b=I3m0kLoUz/aKq5LznNXTUJDcLluycu2bce3Yrs6ilII53/8QEkL2TC+PplljsGYCR9
         HFUwNyPdtwUpUO7TxmbU+FwS+PzkRx+1YjUaBIkoE1zLVSLGc7tJG11vPgEoqyOhhLLz
         DnbErz9L5m0CurRcmzRMhll8bLUDMkXq5m3cMk9+WRA5xHPUY11xCqAtjK9nfI/Ypqpc
         POb0bSRfmkKbOh4sYf8Fw9s2kvDGFXxfrE/JEOwid0lcl0VODzN6W9byvVisS8taf836
         yi4hBXnm4V6hLGy1vAJy/XTRoaAv00XBuw5b9NZE1uFjPDdy4eMblgHn3kFWjO0BlMoG
         +iDg==
X-Gm-Message-State: AOJu0Ywj/IwDWBjtoGDWOAynJqLD9k0EEfWJdmje5jlSoq4Eoap77JFk
	BSGT9mNyrfYf6dBTz1r09LrDp3u/F4vpcWITmsuVL4QaiAyr9lKw93QMvW+Akf9BrotJO+/+QAe
	VOM7SCQ==
X-Google-Smtp-Source: AGHT+IHNgGgQW72UCip4W4I+9Jw0FYToR0o785/jjNuHFyzFVc51E9aDGgP0dlKwXG+uCYkUHGON4A==
X-Received: by 2002:a17:907:a80e:b0:a31:2993:9b68 with SMTP id vo14-20020a170907a80e00b00a3129939b68mr909050ejc.100.1706133291756;
        Wed, 24 Jan 2024 13:54:51 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id rf22-20020a1709076a1600b00a2fb9c0337esm291041ejc.112.2024.01.24.13.54.51
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 13:54:51 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e5afc18f5so64714865e9.3
        for <linux-mips@vger.kernel.org>; Wed, 24 Jan 2024 13:54:51 -0800 (PST)
X-Received: by 2002:a05:600c:8607:b0:40e:5451:be1a with SMTP id
 ha7-20020a05600c860700b0040e5451be1amr1409393wmb.82.1706133290734; Wed, 24
 Jan 2024 13:54:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <75e9fd7b08562ad9b456a5bdaacb7cc220311cc9.camel@xry111.site>
 <mvmplxraqmd.fsf@suse.de> <9481b6d9d015aea25d8f2563bf7bd6f6462f758f.camel@xry111.site>
 <0be1203c9df55432548c92281c8392dfa2f7d6bf.camel@xry111.site> <e8583a3ab0522b4e75ba0ada47b6f093b186fa81.camel@xry111.site>
In-Reply-To: <e8583a3ab0522b4e75ba0ada47b6f093b186fa81.camel@xry111.site>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 24 Jan 2024 13:54:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgVrw+8P68Sy2krcc3QFbm_eu_DRs0-i7mct_0BDORZuA@mail.gmail.com>
Message-ID: <CAHk-=wgVrw+8P68Sy2krcc3QFbm_eu_DRs0-i7mct_0BDORZuA@mail.gmail.com>
Subject: Re: Strange EFAULT on mips64el returned by syscall when another
 thread is forking
To: Xi Ruoyao <xry111@xry111.site>
Cc: Andreas Schwab <schwab@suse.de>, Ben Hutchings <ben@decadent.org.uk>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Jan 2024 at 13:33, Xi Ruoyao <xry111@xry111.site> wrote:
>
> Re-posting the broken test case for Ben (I also added a waitpid call to
> prevent PID exhaustion):

Funky, funky.

>       ssize_t ret = read (fd, buf, 7);
>       if (ret == -1 && errno == EFAULT)
>         abort ();

So I think I have a clue:

> and the "interesting" aspects:
>
> 1. If I change the third parameter of "read" to any value >= 8, it no
> longer fails.  But it fails with any integer in [1, 8).

One change (the only one, really), is that now that MIPS uses
lock_mm_and_find_vma(), it also has this code:

        if (regs && !user_mode(regs)) {
                unsigned long ip = instruction_pointer(regs);
                if (!search_exception_tables(ip))
                        return false;
        }

in case the mmap trylock fails.

That code protects against the deadlock case of "we hold the mmap
lock, and take a kernel page fault due to a bug, and that page fault
happens to be to user space, and the page fault code then deadlocks on
the mmap lock".

It's a rare bug, but it's so nasty to debug that x86 has had that code
pretty much forever, and the lock_mm_and_find_vma() helper got it that
way. MIPS was clearly expecting kernel debugging to happen on other
platforms ;)

And I think the "fails with any integer in [1, 8)" is because the MIPS
"copy_from_user()" code is likely doing something special for those
small copies.

And I note that the MIPS extable.c code uses

        fixup = search_exception_tables(exception_epc(regs));

Note the difference: lock_mm_and_find_vma() uses
instruction_pointer(regs), extable.c uses exception_epc(regs).

The former is just "((regs)->cp0_epc)", while the latter is some
complex mess due to MIPS delay slots and isa16.

My *suspicion* is that instruction_pointer() needs to be fixed to do
the same full exception_epc() thing.

But honestly, I absolutely detest delay slots and refuse to touch
anything MIPS for that reason,.

And there could certainly be something else going on too. But that odd
size limitation, and the fact that it only happens on MIPS, does make
me think the above analysis is right.

I guess you could test it by changing the two cases of
'instruction_pointer(regs)' in mm/memory.c to use exception_epc(regs)
instead. It will only build on MIPS, but for *testing* that theory
out, it's fine.

Over to MIPS people..

                        Linus

