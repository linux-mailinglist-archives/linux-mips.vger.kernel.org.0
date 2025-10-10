Return-Path: <linux-mips+bounces-11661-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 879C4BCB9AC
	for <lists+linux-mips@lfdr.de>; Fri, 10 Oct 2025 06:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68173404970
	for <lists+linux-mips@lfdr.de>; Fri, 10 Oct 2025 04:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989B61F3BA4;
	Fri, 10 Oct 2025 04:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTQhtqJO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186171E3DDB
	for <linux-mips@vger.kernel.org>; Fri, 10 Oct 2025 04:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760069264; cv=none; b=TFKipqPbqtz82PdHE9/l+iQFcF2qOWX21AwK3LBpouOfrs+JHknwSRTXRaQyMNXh5MO0TeCvlAE+1Tah4HvSLDgmTd4dv6Pgr6ttZlzFkCjY5IwWjC6SIYimMaRVKWYYbokOWzwGgyCkhj+b/K4MoLCRurW4nw+5SG/ioZIpDts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760069264; c=relaxed/simple;
	bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujEVVP2R7HVUPxSl+ZGagf+Or0foZzBIO/7j3peaKmXd2JdOUTcoy0ZwP8JOv2qXLvvbrCJLk1ns04epRaNXDm+iwaCkCa40cQRuZ15q5Jbaw2fqIf1R/7n67DwiVO66x0zTe+s0kBPUOdel/smorWET4XmqTwKhvlQb8jGHzt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTQhtqJO; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-780fe73cb41so9417727b3.2
        for <linux-mips@vger.kernel.org>; Thu, 09 Oct 2025 21:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069260; x=1760674060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
        b=MTQhtqJO+fB23BeKxPChePBiul2OLD2R3e4r3/DBj5FLkEAuL0XSceSwP5w5vMbnmZ
         l042076U99GkRQvHqrdAzbVDwCW4eeypNzpcLQdRO1KUT1CBsk/MB0MXNkPJuViMaDgh
         1dDSkmBJLlA+wMSkgc2OpI21yLucA+ywwLmE/B4fj9AKSCShFPkwrCY6j4IS/f6hrzvh
         LHNxt1GryrhatGCYhA2KFuZJAeJ50Yas5ibGAHfG/tMWPAlvGKKMde7gORw+L7RR1o9q
         8lIZjeMw75nk7FSwmxnzCwhNG6pIiaIDRurrsPBd9G2WJTuf2T/CWP2V/QeJEKWVHjc5
         1ZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069260; x=1760674060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
        b=Vam5x+PGT5lgM49kJBxqNSCesdgVeEwBbCJdh1faKeiau1hmdQDZBNbGi/BPZKg0bm
         9RetunZenR+bu5RiN+IN2XDi9DUrRab/xwlAgu/RZnQ7nY5W9Z9bojMIN3iQfFkXiCKt
         gKNk3a2EgaRF14LMbNCI80RxdbdMQAPHuI2TuYsg6dj4HR0R9K7yZZ7u7x0tdrjaa/rU
         yGyTKrvbNYRN57x4+4JJSb6YDLuKOSufczXHPi9KVYDkHFCWmDhq4Rj0e1llY1Si6PpO
         PQpq0CWGEaSV/yOi+8Te33uaUDuYl/0KjiJjZVatUwJvvFblepuJSrHlaDZHIBoZ4+M0
         vUbA==
X-Forwarded-Encrypted: i=1; AJvYcCVqPPJKMM6dfPcoJgY3Wk/AEcih9sJGWRsoeZKbhXbcHP4egNQMMICCf+bfg6t24YL2niOxkeElSZux@vger.kernel.org
X-Gm-Message-State: AOJu0YzhcjLGQNxIU12RhmlBKfVUoSv7gbnaVf7ixuZOy64phEGuwDiM
	2l4Dr6IscJwbg0cnS9nyixwRhoNKR47L67SK/lAl/WIz61u7ZN8YPx4EvUOiYhTBkflCf427RQk
	UortP27X9i3XyA2Kwzy+3VMsXZZAMyEQ=
X-Gm-Gg: ASbGnctstAB4svKqtVpG9ylquBkfUF8/Rgxm5IsEOn8vRC0hp+5PwUov10GwMG0e7bH
	MN+DmjczTrNSJIzhfHqPuKjvteQ9M6Oyg7b0wG0sJx/mX3sANivzfN+4j/xrXWoOE9epJAgmvia
	dQgVKjl8CqZWemEKyc0GWPCxEmxk/yN8HCexeG4TA2yctdXwRxcZ+nYuDYLjAWyIOgKv3Wdv4qj
	gBaw/kDkKG2R9vyTz3Yaolgog==
X-Google-Smtp-Source: AGHT+IFQERg8mTh7nax6OaWavJ8DgllCOHm5p0zLQR54uFFNlwqM0wGCA+Q/Rj/bdvDMe/rRbnhyAA7hAcefbtq0UHo=
X-Received: by 2002:a53:ca49:0:b0:633:a883:3d1b with SMTP id
 956f58d0204a3-63ccb87491emr6995599d50.6.1760069259733; Thu, 09 Oct 2025
 21:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-29-safinaskar@gmail.com>
 <20250916030903.GA3598798-robh@kernel.org>
In-Reply-To: <20250916030903.GA3598798-robh@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:07:02 +0300
X-Gm-Features: AS18NWBct1j-7S8OHD6pljCYd2aEZxR7vcCRPjZz3T1pRcQcUgdDoCBWxEfbyM8
Message-ID: <CAPnZJGAvQirGTJTiTxumn8sAJ5KYDv8+MUTBmEW2fYX+r2RE3Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um, x86,
 xtensa: rename initrd_{start,end} to virt_external_initramfs_{start,end}
To: Rob Herring <robh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 6:09=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
> There's not really any point in listing every arch in the subject.

Ok, I will fix this.


--=20
Askar Safin

