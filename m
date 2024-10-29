Return-Path: <linux-mips+bounces-6547-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9269B4DA0
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 16:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FF10286086
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 15:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004A9192D9C;
	Tue, 29 Oct 2024 15:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct+PjJ5V"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9CB15B0F2
	for <linux-mips@vger.kernel.org>; Tue, 29 Oct 2024 15:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730215246; cv=none; b=sM3czlsF8F8PEAxDLBwXNqCJQazQzNjmZclfMms2ifgESApxLkYoC8oYD00ba8QGXizhmTrBBassq5Dew0WH0iv+5q/oxabkeM9SXQ5Tbk/+azDLSGqVxa7YJKDH85DG0VK7mR0vGHY18rrKVVUtMBdpl3nbhASA9+GEXHCXE3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730215246; c=relaxed/simple;
	bh=gTDaqZ7El3iXFJi00CveYPqyDZka0u9Vh5+fimbZZuY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=lIQ01+EnmaDs8V3TOtrdVgHPt0G7uDxJiYXP/nv1z/OP23kMj4IPLa7FbsrLg8mylGJdlwC1reBmqTXLYza0CUlqfhbP6JL0DSEsEGLR5q+uCnr79roUARM+vBdfZig3sK3Yj7kJh34c9+pPaMM1Bp0bqa1DQuPBWBUwn1xVmFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct+PjJ5V; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb5638dd57so51324321fa.0
        for <linux-mips@vger.kernel.org>; Tue, 29 Oct 2024 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730215242; x=1730820042; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FyVXVxom4anqKU76g3Au6LGI+Blti6sZSVzQLi7Wg8M=;
        b=ct+PjJ5V+I0jeoDRYFUKFoTl5iW2IOspAvUojnajy7UOFMCPs2EJtPIADaxjRIWsLI
         7nw27hw+WlMJPGN0Yuzgxd24CRjnKIRXDeeUxrFAwDIN3sNQlYZBf4yaQpCDpdW1wssi
         xovjGenyIWVmqjZvzZcoU00/pyoXYV3nU1qHp7cfomE8hCkZKuUso3TuwL2eryD5R7rC
         pobesKQT92mbIBkXI7HEzKQ4m1Fbh1vWQgmPf0MtIsgg2O2mAUoh7WNVa4Fb+/F0VFN+
         ZWbpEgzWWUzzVjQs2bTghBDzuOycS4NTBUR5mSAFckMiTzg6Dfpw831HXAEoj8ti7C6D
         jeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730215242; x=1730820042;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FyVXVxom4anqKU76g3Au6LGI+Blti6sZSVzQLi7Wg8M=;
        b=M0Rbmzt6H/v7h37yTBSKORljh1twDKSaNwNWKVtEkq5X1xGxt9AK/KuCyKxdwpHggo
         zm5/+2rTX2PMLsLeMNUEwTbq4uqjFEiYh68kJZCATtLjRLTHvPYD/xShpqkST8UNkSyW
         6CgLBgtVLON9/LmD2a5oVeq1Pm0AmmyItqFLHXWOsajD8+eqzhryujIXSlAsrTdSs30x
         9SAfROhtsubBOl/WZj5zdFdRwCDtz1WlbpPTZ+Xk/qjdsje4huRSi2ZZeZ7+zatyfYWy
         NNhByiTj2DAOWYNrvRezJWIhez6NI4qtLuadSkcW3doI1SeDqnkXTvwwsRml5Ur8aKue
         VC0g==
X-Gm-Message-State: AOJu0YzMcbrUPof3T/EDlNq2LZ/PMcyAzzE9mpYxqOPwZKSDCE4jxZ67
	nNjIcYrSwq6l8Q6TaKAJ3cm3dGwkrG5Xj0+/ZvPqCRoYsdeAqSFA+9gFEpQoPLVE73feCP7N7np
	qxMOvtObYOepq96nB9yuJNkhITPmUN20J
X-Google-Smtp-Source: AGHT+IGEc5I2tNmY1MuSkSnY3aaosNp1u1PPJVOyxsW3s1sv103heRn0rYHFsM5iclEfzdgS3kG60XivTJ5vKbO4T7Y=
X-Received: by 2002:a05:651c:1a0a:b0:2fc:a347:6d87 with SMTP id
 38308e7fff4ca-2fcbdf7db3dmr52464031fa.13.1730215241769; Tue, 29 Oct 2024
 08:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Tue, 29 Oct 2024 16:20:33 +0100
Message-ID: <CAAZ8i80GGmwy5u1dPoG+f43PxGgD_pFhOrQkEr=5bhmLfn6sSQ@mail.gmail.com>
Subject: SGI MIPS, Speculative Execution issue
To: linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hi
"Speculative Execution"  is a feature of the R10000 Processor.

I read that is problematic on machines that are Non-Cache
Coherent,such as the IP28 Indigo2 and on R10000/R12000-based IP32 O2
systems.

The first thing I don't understand is what does it mean that they are
"Non-Cache Coherent" systems.

I mean, I know what coherence of the cache means in a multiprocessor
environment, but I'm a bit confused by what I read for these mono
processor systems.

As far as I understand, in the R4k and R10k architecture "coherency
logic" should be on-chip of all the participating agents, both CPU(s)
and DMA masters, but I didn't understand if being a "cache coherent
system" depends only on a hw circuit implemented in the CPU (on-chip
-> inside the CPU) or if there is a need for circuits external to the
CPU (on-chip -> inside the bus controller, or something).

a) SGI IP28/r10K -> not cache coherent, but uses R10k
b) SGI IP32/r10K -> not cache coherent, but uses R10k
c) SGI IP30/r10K -> cache coherent and uses R10k

A few more details on the nature of Speculative Execution, and the
issues it poses to the Indigo2 can be found at the following URLs:

1) MIPS R10000 Microprocessor User's Manual (pages 51-55 )
https://web.archive.org/web/20051028113506/http://techpubs.sgi.com/library/manuals/2000/007-2490-001/pdf/007-2490-001.pdf

2) Post to NetBSD sgimips Mailing List on 29 Jun 2000
http://mail-index.netbsd.org/port-sgimips/2000/06/29/0006.html

however there are no sw/hw examples.

As far as I know, Linux never worked on O2/R10K, while, and it worked
years ago (20?) on IP28 only with patched gcc to force "cache barrier"
workarounds.

I cannot find those patches, and I haven't yet understood the issue.

-

I see that Linux, NetBSD and OpenBSD all work fine on IP30, even with
a couple of { R10K, R12K, R14K } CPUs!

The R10K is documented as a four-way superscalar design that
implements register renaming and executes instructions out-of-order.

I wonder if the problem is related to this "out-of-order" nature of
the CPU paired with the Branch Prediction and Speculative Execution
nature of a purist RISC design.

Thinking about that, although one or more instructions may begin
execution during each cycle, and each instruction takes several or
many cycles to complete, when a branch instruction is decoded, its
branch condition may not yet be known. However, the R10000 processor
can predict whether the branch is taken, and then continue decoding
and executing subsequent instructions along the predicted path.

When a branch prediction is wrong, the processor must back up to the
original branch and take the other path. This technique is called
"speculative execution", and whenever the processor discovers a
mispredicted branch, it aborts all speculatively-executed instructions
and restores the processor's state to the state it held before the
branch.

However - the manual says - the cache state is not restored, and this
is clearly a side effect of speculative execution.

Worse still, if the speculative approach involved a Conditional Store
(SC): will it be restored? No, because - the manual says - if the
cache is involved, then it won't be restored, so this is a real mess
that needs at least a sw barrier.

(I can't find software examples, I would like to read them)

I wonder ... is there any hw-mechanism with the IP30 (missing in IP28
and IP32) that saves you when you are playing with cached-memory and
or LL/SC instructions in a conditional block (e.g. semaphore, mutex,
etc)?

Can someone explain this matter to me?

Thanks

D.

