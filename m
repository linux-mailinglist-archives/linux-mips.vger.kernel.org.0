Return-Path: <linux-mips+bounces-11521-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F51CB86CE1
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 21:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE9596273D8
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 19:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26943148D3;
	Thu, 18 Sep 2025 19:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNlT1dRM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBE030C119
	for <linux-mips@vger.kernel.org>; Thu, 18 Sep 2025 19:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758225501; cv=none; b=ae8/OivbhpJ2Y2VeXtDGLigaUegYav/bfsaxLb69XkJR+CCsvzIjmNZD565avjS7yZcN/ol9CSj6M4QuABU2pIUiOSnlQ6JbHgSgsp6aZ1dUjPrPf0PP4S/7isfvRtob0dCC14zLijBVzXE4jgrK5oJYjim1EoyISeV/a74KQmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758225501; c=relaxed/simple;
	bh=hrTKVKMuOKbLilzSA+VEl+XSSF0VIocT2KvCzkuRjcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOuqnDzSzpuJaC2/tq+y/FVG5rKb8WjzIN7s8k88xlpScA+wM1je5TtdYOY4AuOLC3ckdBwc2YsTrIZzjCCzDtgBCrLnz9bA4sWYvwoCUfPxAVZx+VBynuY8+SXJO83FCAmd7tB8gxpxztlxZvROovMR53HusW/fkMh9wId1MPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNlT1dRM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b04ba58a84fso229631966b.2
        for <linux-mips@vger.kernel.org>; Thu, 18 Sep 2025 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758225496; x=1758830296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=hNlT1dRMFhV3nNEO8OCPXfEiZjy7HadMXu4vRgp3Ipj8QW/pTjkxFRxYZEa69pe80J
         R5WZR6uBlmeIbF+VQhBUi3wnRJuDxh3ZSYPm2HtEzHdmYgYFzaLOTkBNZpxqwUsXFCi5
         xh48TC/I8mOWxP2I4D6qthvi1wAkVJadHw9+Q6aETqCdcS+tzshGNcO1qODnTVXpUxR3
         DzGuLf7FRf7YNLECrqzb9ayMBLdTqRvBk0ivmzKueGmRkmu1GRq1Uqn5Uc0kg8EqXgPJ
         5wCj9Urjk2M3jfgX+oYXsBuDx3I+zNM2GW5fMn6rB/kk6qlx/ZV55XBxceRxo80pIEfP
         n68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758225496; x=1758830296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=gShn+Vh3/l9gjr7mnhXpU7M6xvoMj9J2bWbQ+026RsUZCFtT/FGTvygNgrSNAZDx5X
         m1yW/mwO5s9Mw29kAjYUvkYnjdWGb7RWCGQ0orNuWAv8MHm1OcVL9h+/ma6ug0amysOt
         p5JC9cjtVmFCMVCXGph5PF+WXPJRk72xKkbbcfKJLFRuO3y/MOtLrKqP7dpdhbfC2yrj
         gKXoks9aYMrDq2Ox/QNk12G83boizV5lmNZrytRo+m96Mgij2FkWU69L6ed4lsn0Mv/X
         BVCU37Fsv/ZJXeOyReUcxlcswM57soDLQr2GwAOsrTVw1rGRcXpyosPrCcQBjVZA7SeA
         skRg==
X-Forwarded-Encrypted: i=1; AJvYcCUyVDFhOTcfOz/SxHwrCLP/ENeC1eNNrt7axCDkqo/mdc6vdw0kuXoBIisV6t6cQuoUpnp23ZDwclop@vger.kernel.org
X-Gm-Message-State: AOJu0YzLUA8wDLcIe8s7qZcZyYS0ZYVRtAPZhWQIJrCAS5g2PXmEzwwX
	iVVt9I8JD5rzRzPFKv2ZzLjFijKTqHff0EPU8vcjEGS7nUXAxLy2Da+u
X-Gm-Gg: ASbGncvKWUL+Mj7mQHN5da/XcACZbZtrEjERnJuNom7QbFZpgF/gvrmNvTaWpsUIef9
	tyOmAtNtzlI7QKRgWefz8x0q1DWdamszQ9nqdM2NYGdMQQvjtOfDHw9Pft2MCXHGOWObEZFhvVD
	RTVtQJMLzQxXrK46ohFsSbHZDcCN+6D0pOT01oLpJe2AzFKeL3DKhPd9+bnJP1HMxwDN97U2jxb
	2sFBP1OHhv8psbAdm4QlzmzfKBcnOx98WiHYGGQXccW2KPTE8cE3uHBLY697RRLT1FWKxjMOqva
	xAjjGvqQQtNtkDHt5JRaMmtTNIHk+HCxUdXMnOTh23Aq4DbGW1EAuG4ZQwc1WrdmBp7jsm03CB/
	gTNalTpj+5ssFttEkIoAdzb+NIGWgVqHRKw3BNg==
X-Google-Smtp-Source: AGHT+IH2NBu6L+bASXNqg9sJUcZ42MFCB2aqzEFiqoDEW6um54A4CtHcJnO37auTgFbi6nwycKDm8A==
X-Received: by 2002:a17:907:a089:b0:b19:969a:86 with SMTP id a640c23a62f3a-b24f35aa177mr45885966b.37.1758225496090;
        Thu, 18 Sep 2025 12:58:16 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b1fd1101c44sm264530466b.82.2025.09.18.12.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 12:58:15 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: nschichan@freebox.fr
Cc: akpm@linux-foundation.org,
	andy.shevchenko@gmail.com,
	axboe@kernel.dk,
	brauner@kernel.org,
	cyphar@cyphar.com,
	devicetree@vger.kernel.org,
	ecurtin@redhat.com,
	email2tema@gmail.com,
	graf@amazon.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	hch@lst.de,
	hsiangkao@linux.alibaba.com,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	julian.stecklina@cyberus-technology.de,
	kees@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	mcgrof@kernel.org,
	mingo@redhat.com,
	monstr@monstr.eu,
	mzxreary@0pointer.de,
	patches@lists.linux.dev,
	rob@landley.net,
	safinaskar@gmail.com,
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Thu, 18 Sep 2025 22:58:06 +0300
Message-ID: <20250918195806.6337-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918152830.438554-1-nschichan@freebox.fr>
References: <20250918152830.438554-1-nschichan@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> When booting with root=/dev/ram0 in the kernel commandline,
> handle_initrd() where the deprecation message resides is never called,
> which is rather unfortunate (init/do_mounts_initrd.c):

Yes, this is unfortunate.

I personally still think that initrd should be removed.

I suggest using workaround I described in cover letter.

Also, for unknown reasons I didn't get your letter in my inbox.
(Not even in spam folder.) I ocasionally found it on lore.kernel.org .

-- 
Askar Safin

