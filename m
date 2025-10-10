Return-Path: <linux-mips+bounces-11662-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E36DBCB9D3
	for <lists+linux-mips@lfdr.de>; Fri, 10 Oct 2025 06:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CE8C7351D1C
	for <lists+linux-mips@lfdr.de>; Fri, 10 Oct 2025 04:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6441F03D8;
	Fri, 10 Oct 2025 04:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDuL5tqL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06A233993
	for <linux-mips@vger.kernel.org>; Fri, 10 Oct 2025 04:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760069382; cv=none; b=dyiIS//E1WfuZ6X0lug0e0jH04lJyOTr3TrZRdfwZWm193/974wmc7fdLhU9+5aNiEa4lyFqLySYgRgJcGhaXstOCm6xQPQDVn+ToR7rxiiMrjrKvYiv+wpwYPpu1ANHtQ4TQXRC5p+64ZhtMiZfjnYI54zIluygiPCtX0AWS8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760069382; c=relaxed/simple;
	bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDGmlHw8OTcWu2JZzP3boY8EIydOy5T5UGmD95Zcuw2yOifvCU6bACGvRcXutFLx0yRZqUjLhiDJeEiZw24XtX53CFW8XYEgqRvBk/uaQmR6GWH/g7m5WNkQpmykEcQOX1VPD4SaAXhA7mZQjCe+qYOl72t9DHzsS227vc/+x9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDuL5tqL; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6353ff1a78dso1599557d50.0
        for <linux-mips@vger.kernel.org>; Thu, 09 Oct 2025 21:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069379; x=1760674179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=nDuL5tqLs6F/bqWcdATCSw3q6sR4xH9PojO9qOD+5CVFhCKnIdXYLqb6N9qP3a90AK
         XcWKwh2rGBNpBKIw4DXxov8U2qs0Dzy6gXk8vFfvDusYiZmPGdnri/OyTQj/4/Q9hjBA
         AP9cRpfxElOVTqf47iRfDxq23HPr72skNOU/r2V/uYwO0u5rdlLaDJlfE0FHTHhwxXRY
         CxV+l2MjGbd2BdsN32iKqGDmRkhB4tNQBtMagkevAiwpNidXH4OagDZ/3oHz+Ju9tDVq
         V/7yZAk0s3YGeHhlLGi653f8C0CT7tXpjc3Ab8zbhGaCEogKGwXedDHs/+NW7Be9ThrK
         SjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069379; x=1760674179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=ixSzWb0swlN32+OSdumo7sYq1v1YM13ME9i90ZBmX2vvWUo4gAt/tDbj88XY6Rx5qQ
         o2lNI/7IGk6DURCyGa6wwA50MxQ/eCUeurJSlDNOAXT9/DQVgSv9QlaViiisD+jAwasH
         uYO5HP0eHWPFEvD9MvfRZp55pkm7CPl8tZ5QNbfShbztnwGTqHTZZfs2CG8vbmZ5jd4l
         R1RKceVi6+vDWFJMrAPXtW2lJTQrxowktRQ9GNreU4yv+JpsLXIjM982gcUB2okuW8WI
         N+ensg3vcLL8OYYOhheEqOQoJ9SVqoniMCSOnMa9lIA/PanFwVXnPkVtp+hLaiO3JuQ7
         QePA==
X-Forwarded-Encrypted: i=1; AJvYcCXDwFc/O0MpzVvnxpmj+hSn/K57TzWE+KqcGjBL+OMkHnsLs8kmCYm04Q0AooKinLo6P0SdT6FjRNzq@vger.kernel.org
X-Gm-Message-State: AOJu0YyKP2f4L2ZQoiz/bdXCCfganL8ckB5fBk5hewN/mfvom1fFnw9c
	dQSJ45GPCESgDk0zf/he7fb5lYyNDhzU6mDpEG5NmXLlebLpFdk+qCICN+Ui9Z+RVUnurovZFnl
	36MkJTk4xpgHstqQqS6KuCdTL9IkC1mg=
X-Gm-Gg: ASbGncsJD9J7LxQRZb6xyx1Lu8wywpBzmfh69tsIr46DygdDjpXL/U8F+lOlsIMCV13
	MnWhDChXKU/KB8zG6cEvJkBDXCPkalkUVUMlxvgazdiPstL5Dd4En4fMbSkBYHhzUpGt0Nq0VAK
	Uh6qQIUnvYiMedLyhffXI3M9f2HNV83kPUPyYEHSTWTPHq4r4RLVyhVnzCLQNPKxdjlfHg0PfqS
	og9a7hDbj3OWI3ZC6AbexlVtzxI621rwd/+
X-Google-Smtp-Source: AGHT+IEKzDZJ3mg1FFWOqowFJqWLj/+dmJPdM199pmmtVcavFH/YLuoH0hEdsvn7dHSOiTNw/3Aomiv0DcOjJivXzrY=
X-Received: by 2002:a53:e946:0:b0:636:17d6:a30 with SMTP id
 956f58d0204a3-63ccb82410bmr7618496d50.15.1760069378763; Thu, 09 Oct 2025
 21:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
In-Reply-To: <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:09:02 +0300
X-Gm-Features: AS18NWDxe32nrD4BfQQFhIe3tEEfxrwgJsYQo_BWhSUPsy5CceSv7QOcZ20roI0
Message-ID: <CAPnZJGAKmgySY_RK0kmGTgwUh9hw4FSrVR+LoJCbD_RmJZe6RA@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Jessica Clarke <jrtc27@jrtc27.com>
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

On Tue, Sep 16, 2025 at 8:08=E2=80=AFPM Jessica Clarke <jrtc27@jrtc27.com> =
wrote:
> I strongly suggest picking different names given __builtin_foo is the
> naming scheme used for GNU C builtins/intrinsics. I leave you and
> others to bikeshed that one.

Thank you! I will fix this.

--=20
Askar Safin

