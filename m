Return-Path: <linux-mips+bounces-6479-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B89B1274
	for <lists+linux-mips@lfdr.de>; Sat, 26 Oct 2024 00:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71A8FB221D6
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 22:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEBB1D1E79;
	Fri, 25 Oct 2024 22:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnsUCoKs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D639217F40;
	Fri, 25 Oct 2024 22:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729894577; cv=none; b=tolFa/TlmvrERuqrHuzvte7Tjr4ql0VDhT0poCiwWAsGKMaDIBbdFK+5lqRnQ9LncJra/DT5O4dorrER4b7M5pqJc09atXd42zUrr/Oa9xx6mwEpqW0TQ1ib0tRUKM1+ZyryJkiWCgnGocviNJ2bWtd71A1o74bCngL1xWOaxvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729894577; c=relaxed/simple;
	bh=uJTuxxbpUOhYgzs5WgqjZ9oJKXZ+IXXPP0S1EvdK364=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EBSGcxSHScBEBRpfzv0vqrC5YkOllkG27SEYG5XKHteGqUorPkVVbNDxahLmzmVJ0l7q7MHPyUUAilQwET13kvL5g7NvHJTZmO/skZ/KSy5hC7y1Z6rQcNCbJCWVBreMBRTJB/N8jYaevVGY6eIc0M5SQHz+2ybjOKh1CjVAqwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnsUCoKs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD093C4AF09;
	Fri, 25 Oct 2024 22:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729894576;
	bh=uJTuxxbpUOhYgzs5WgqjZ9oJKXZ+IXXPP0S1EvdK364=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nnsUCoKsPy331Chn2UUcsngk6k5T9x6sJ5x/vQCqmf50lgps9XEwpgmo4ieWnMh2v
	 hKKhwmyShVPTqg/aa8W1r73marKoLDlVeVlofleUY/xPKgT1+9Mj3gW7tRebb1/J0Z
	 0Nb8Myml3Mh8xhW6GxZCRVqJQI9a0IlZxwhIb/FFLjWW7zb3vS5IAOKR5P46cuH1bX
	 6HIe2Fv9Hy8qoXg6BWAQLe1RwZxXCtspPILf7Beo+xbCY0Zov9G0Zr+tfys0Y9cjmm
	 B8TBd0ZUpDH1lyus/5Zn/fUtOn0w957/BJ7tJ0vN45wzDau2TLxE75xt0/m5uLMVPd
	 35fr3Z21N4TFw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e690479cso2617526e87.3;
        Fri, 25 Oct 2024 15:16:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKprcsRllH7BJ41sXSlqyiCtIEsZ5vnmYR+0LZuY6d1/SABCV4Eki8T+FS+cDAf7Ae0Xa34HX/3o8=@vger.kernel.org, AJvYcCVbtVU1h19fnBYgkPHPIuPVmzehwOx3o1Nvl9HFsoZ+WZREgRcolAuNCgtPmCv2x6sARdrCSHszGMAmeoSQ4aY=@vger.kernel.org, AJvYcCVmrLmjITh4Vz5rfc6pQkgS+TdDkeDTDhhapBIizEAHZfjr4BA0PTnjQeKc1l9o+wlTujqosk/Juj1U@vger.kernel.org, AJvYcCWgNNJWtqw0SNqrO5synDUeNVMHVpTMwpQBgYGWbp8LGyIgJNCM2JbITEaHeYr6I+bBiTFfuuly3GltLA==@vger.kernel.org, AJvYcCX66Kl9k9Pj5j2YoaCxI3IBhJtrzoV6SAjWvwXY25tTg7yPZ6MRFuhaELIC3AtFuyorkyRPEaRdSk6NgEVN@vger.kernel.org, AJvYcCXk7+aoCbzPQb0qZOhdFPB5agJ6xjWL3i430K4kk4cakm6LEqnQ173u/Got0SfcCVvsVbVr/5nCFE8zgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy02GYSOV3/Ce2xQEewmVNy4zY5tTDypkvTAnF6N02Ff7wzHJj5
	KDwmA0xSn+Rjjywy2e+QIjAZSd/boiumJLJr4HKMxjlvTge52sEq8d7BGZO/+uwOIDMcQ0ol4Jn
	HdrViav/x34Dn0aLHRmgwrk/WbA==
X-Google-Smtp-Source: AGHT+IFDzz30e4eepxmp8y9NIgcU0ohK45V4obAXv/vuq7kDznzhS/1RZo0KUZFB2KLhRb/lyUfqMvvtY4COXI6AOVA=
X-Received: by 2002:a05:6512:3d8b:b0:539:d0ef:b3f9 with SMTP id
 2adb3069b0e04-53b3491dfc0mr415910e87.40.1729894575274; Fri, 25 Oct 2024
 15:16:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023171426.452688-1-usamaarif642@gmail.com>
In-Reply-To: <20241023171426.452688-1-usamaarif642@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 25 Oct 2024 17:15:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Message-ID: <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Subject: Re: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and early_init_dt_verify
To: Usama Arif <usamaarif642@gmail.com>
Cc: mark.rutland@arm.com, will@kernel.org, leitao@debian.org, 
	catalin.marinas@arm.com, tglx@linutronix.de, chris@zankel.net, 
	saravanak@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-openrisc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 12:14=E2=80=AFPM Usama Arif <usamaarif642@gmail.com=
> wrote:
>
>  __pa() is only intended to be used for linear map addresses and using
> it for initial_boot_params which is in fixmap for arm64 will give an
> incorrect value. Hence save the physical address when it is known at
> boot time when calling early_init_dt_scan for arm64 and use it at kexec
> time instead of converting the virtual address using __pa().
>
> Reported-by: Breno Leitao <leitao@debian.org>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")

This looks fine, but what is the symptom without this compared to
before the above change? The original code in the referenced commit
above didn't remove the reservation at all. Unless the current code
does something worse, this is new functionality more than a fix (for
stable).

Rob

