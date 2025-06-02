Return-Path: <linux-mips+bounces-9150-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE729ACB619
	for <lists+linux-mips@lfdr.de>; Mon,  2 Jun 2025 17:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB0CA3B680F
	for <lists+linux-mips@lfdr.de>; Mon,  2 Jun 2025 14:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4929022DA0A;
	Mon,  2 Jun 2025 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Pol2xe6i"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D7722D9EE
	for <linux-mips@vger.kernel.org>; Mon,  2 Jun 2025 14:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875580; cv=none; b=YH9ffOf1NapvDziLLJA7ZmV7eKWg0Y2win6USq16cZauj8SjqXaK7MjK3Mvjc9NK9ITFJca1QpM7+sGNcSniaZRBdyHt/vZkk0emk3Tt/1+hdeM/f0k2/k2KdmpT87/FEcG4qXrgO1rOvFyq3uQsBB4VrJ5tvfSGcgFftqC1/qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875580; c=relaxed/simple;
	bh=BMdmqxyCVbd7fEc++ql37zNwaBo1D8/TV+gOsCFIGWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNLUYIySYcimLHuCV+nM1FXpXCQJgrzCVMMVUOM/trHJFYBTyiFOf9D4w/HjdamHpRsmJy4Jf7xuwXCHrF/zp+hGV03CjqHucD0cRCzkAWWkw+T27tsvuQUV2DFuQ5uezNEZFBUMwjEVGkqEZcfPfZQ1Ze2NLU/t5m58ntnuWZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Pol2xe6i; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso1355731a12.1
        for <linux-mips@vger.kernel.org>; Mon, 02 Jun 2025 07:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748875575; x=1749480375; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg0dwJvYfbYUNtSY86lpjPZ26U71B5eHF51TBSSqPe4=;
        b=Pol2xe6iLWUjqw3z1pMZOI9UZRPPdcVHCR5cwytf/Up+ghsDXi75lM87IFF26FFZIh
         XVIySgqsN2xGMeRjBzAUwknaidY3P5uDebKmCr5pv0qIi3FBSHcll9Xi5x76Xge1OVdP
         xPJUuE8ihC25KVehmFitMIDIIRFxdCKWeYoG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875575; x=1749480375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg0dwJvYfbYUNtSY86lpjPZ26U71B5eHF51TBSSqPe4=;
        b=OUZbh9NuBu68BjRVWMxkkT8sBycjyTk0Oh8tqjaKcf0yN1n5tynhfKeMxfnhldatpL
         mb6YXM9cxfTjTj2uubX+rfw9bVETZsONTiclIGvpnxqZ1Qwq/8dZPc859x4Ie36OZXab
         Edi5b5fWuP+EEli/IqcYkXHfGORv1tPMb/jMGCEHiXtTtQvBPFEIFRzqwspDVFTE3o+J
         mWkHCpWBVCgVDXWXQmFrUR1X4oFAVs/PStUEZFcCJ0QaFedG9j7BjvjwPi7H/5iM67yy
         MDsq0AjE+STCmupNUbJjDa++1XYMi0mFIibZvnGDZ7azYOcc80x4ShrfofmjX2VtNA9e
         eBww==
X-Forwarded-Encrypted: i=1; AJvYcCWrbfRYAWqXmVHS25YiB+UmNOJTFugP6/zYhulutvDpiAA9WR9yTV4B73MPYkAcF5S8nFhjb3TlaH6d@vger.kernel.org
X-Gm-Message-State: AOJu0YzJE7KekCo0M9lP8/ZELO7N0XjkimKfY/S6zBjtNhzf/POCEnj0
	00uERMZyvtSiyRnDywfqpYDVSLTmYAa3T2z5g653JtLte7UDL6OYe9stSdOtZKs5rbri4EZxqxp
	uJg9J7nU=
X-Gm-Gg: ASbGncsKMYxDTy4lWg6xrWTcHVNw1eVVnp+imy0fQimtDaKQevTYpiUEYDwijldKKN/
	KezIKmCPojX602p3op/QoWnv+YUVqiT3jlnctC2WvkxhZ1pMW5ywoskGJjZbVXDdgEsTM7EY5DS
	JlGfbpl55QAmAxCbgEPZOvUBIR91+oAFsHoZj/ukTUK3hFZ5wb+tuS303fXBtR7qSgE1h/3byjr
	ILu47injUFM/edNcTD+q7OGaTKGoD/TEyR0MGFKqOlCTQj3G/QeBHMptrx/RjJ2TP3/RwfDJoIy
	82ehVXNY3yuokb9V9z/UYJkVumeXIkWeSvbnuzKEmWuOKRp+Q7tARYDxvS0ZNUOiKdPSzvHDpz7
	g6Jn66Ppg6kkn51drVxOhIqdTBNESXzHdvHRH
X-Google-Smtp-Source: AGHT+IGtdJIdlZVWeNTMxDkQ4+I6vX5ahq/R+aqt7wHOFaicKK52hMhGzLc/HyBaxweyQHqAZwIVcw==
X-Received: by 2002:a17:907:1c92:b0:ad8:9b2c:ee21 with SMTP id a640c23a62f3a-adb322b344cmr1106071166b.2.1748875575405;
        Mon, 02 Jun 2025 07:46:15 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2bf0b3sm804703366b.112.2025.06.02.07.46.13
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 07:46:13 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso8080432a12.0
        for <linux-mips@vger.kernel.org>; Mon, 02 Jun 2025 07:46:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrKYP20UZwwu3FCTycJiwKQqHc8HCk207jFrVa8QGAqLlVyAozzWgPDdE9eIac+Uj+zVZe/FVN8pDF@vger.kernel.org
X-Received: by 2002:a05:6402:5205:b0:606:3146:4e85 with SMTP id
 4fb4d7f45d1cf-60631464feemr3563572a12.4.1748875572780; Mon, 02 Jun 2025
 07:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
 <20250529211639.GD23614@sol> <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
 <20250530001858.GD3840196@google.com> <20250601230014.GB1228@sol>
In-Reply-To: <20250601230014.GB1228@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Jun 2025 07:45:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjO+t0FBrg=bHkbnXVsZ_U0TPgT9ZWUzu12-5NurCaWCA@mail.gmail.com>
X-Gm-Features: AX0GCFuodXM8SKmhJCuuDQhW2iq8pjrSnsjy_QXiBCm4TA9D0azfhocKT2KWhmk
Message-ID: <CAHk-=wjO+t0FBrg=bHkbnXVsZ_U0TPgT9ZWUzu12-5NurCaWCA@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Jun 2025 at 16:00, Eric Biggers <ebiggers@kernel.org> wrote:
>
> I implemented my proposal, for lib/crc first,

Ok, I scanned through that series, and it looks good to me. A clear improvement.

         Linus

