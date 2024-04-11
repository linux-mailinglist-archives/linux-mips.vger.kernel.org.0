Return-Path: <linux-mips+bounces-2726-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E708A1D49
	for <lists+linux-mips@lfdr.de>; Thu, 11 Apr 2024 20:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F625286DD5
	for <lists+linux-mips@lfdr.de>; Thu, 11 Apr 2024 18:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E577E4D9F4;
	Thu, 11 Apr 2024 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jG8xIRjD"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7859C4D9FC
	for <linux-mips@vger.kernel.org>; Thu, 11 Apr 2024 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712854663; cv=none; b=Py8ZZRpLIkGSCjnvLL46GyqecodyUzb0IbQ9Zd52XBDsxp4Cfx8To/4BzyB4hO/8IimZTI/ih7hye/vpUlda0MhiPYGFtZAXJGhzHAXwbIKhEKzHBBObzQ+GtiuH+1OwIrADPvkqH1II/ow9DkyTTvbJ/um430a72PdNwruSAjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712854663; c=relaxed/simple;
	bh=mW9Wy5zwtCPwddAQPsiCFCBdlF3xxhTlbzOesWPW9Dw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GY/Zs7GlVp+faZIjaWRq7oFGh6CpU9NyF9ZT3KDR6aoHbxx+CVnDSvHYWOf5pUXwjjCVGl/RpdrBvFRPFTfQjuQy1P6QiR3x/Hb0KKzk8cWfW0l++qhlrvRTsyHI/2B+GAeu4vNXgyv5xPWE5IHljJZznL95JuLMhfT5g2NeB/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jG8xIRjD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712854661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzMoeKDG3HLVO21BydyhZtfJookrt2+0z0ZoaUJK4l8=;
	b=jG8xIRjDRu3wF9/9EX+DlVHb4kaZXOYZvahAgm0A8+t2B8cBpIqQDd2YyUdb3T07tnTQyV
	SzfMrirNl7umdwrQxKArQ6vM1n6FM9gehFJLIPh2xQXdSG7aSBC7AnnZRdyzM1pfSi91Ub
	6OBgWJTbPx7mwMv8vNCRato1Acg1os0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-_jXPEAjFM5GYvY-KRpH_oA-1; Thu, 11 Apr 2024 12:57:40 -0400
X-MC-Unique: _jXPEAjFM5GYvY-KRpH_oA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-417df7b0265so373015e9.3
        for <linux-mips@vger.kernel.org>; Thu, 11 Apr 2024 09:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712854658; x=1713459458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzMoeKDG3HLVO21BydyhZtfJookrt2+0z0ZoaUJK4l8=;
        b=q6cq8gpKI0huEKazWON0f+C6n0LcBWuE6WRUXw+6wjjwt/VhqZUi74AFWGnxJz2r3/
         bVJ4UH6NSa4aGL4rJNuACqAqiC2cymq+kR84o12MmnDl/0Ap+lxuPhjevwOlYGlBCK1T
         YSaihkZW/cJZbbLHxfsx3/rapC/8BzjYhCVuRktFa0y9FSv5gWRp/7lS0/hVZrOc+Yfm
         16vpf0LcCi7lYKKlzEOOuopYbn/Shrf3grEsesZnC5ZjdTeigVRDxx2TAKJv1e0RYrz4
         vaaZurIs+kqE6i9I4N3Vht7hJYZWPLMvBIIlXa1oEgAQzEPey1+eaDiBlr+NrQdG2jir
         NBLw==
X-Forwarded-Encrypted: i=1; AJvYcCWYMBFPMtakVODAWYX8DDAFYIiGMnbocT3wSkBjzJjSdd1gvLfXg1yYMJQUPxGdy3IKAMO2FZ9VQh6FWFbmuvvurX+0lE2+8fSZXA==
X-Gm-Message-State: AOJu0YyY1NNpYyYGaKhQcph/QiN8UY0nAUguHr+hnrVlnulyrubCWB+/
	AMyW5VXIoSIjxpjlhj8NrDx2DnvBOmwI5zZGUXkGyA5va980AdUhrNeefv0uR1nLwvxuy3/g5n1
	O+mWgmB/kD2cuAQ/QosRZgOZgGcykIJfp68fTeJug/ogi9Qa7Ef6fOekNLZmUNyCH9t3acYccqX
	ya+IVLIPOJbz2KstsVAmlh936aDvS0HdyABA==
X-Received: by 2002:a05:600c:c07:b0:416:b75e:ffb9 with SMTP id fm7-20020a05600c0c0700b00416b75effb9mr294484wmb.19.1712854657978;
        Thu, 11 Apr 2024 09:57:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmoGFz39xTCvG23vKtpQgogb148s+KvVt7/U1rBvktp1dcwHHxjM7spsq3rgOmQW5LGi5xUnT62q1v5vcy7Gk=
X-Received: by 2002:a05:600c:c07:b0:416:b75e:ffb9 with SMTP id
 fm7-20020a05600c0c0700b00416b75effb9mr294473wmb.19.1712854657685; Thu, 11 Apr
 2024 09:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405115815.3226315-1-pbonzini@redhat.com> <20240410143020.420cafd47bf8af257b2e647a@linux-foundation.org>
In-Reply-To: <20240410143020.420cafd47bf8af257b2e647a@linux-foundation.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 11 Apr 2024 18:57:25 +0200
Message-ID: <CABgObfZiEiLbbp35gNmSGd9vNr03__Eep+D_Mj7r2o+XbF96TQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] KVM, mm: remove the .change_pte() MMU notifier and set_pte_at_notify()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, David Hildenbrand <david@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 11:30=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Fri,  5 Apr 2024 07:58:11 -0400 Paolo Bonzini <pbonzini@redhat.com> wr=
ote:
> > Please review!  Also feel free to take the KVM patches through the mm
> > tree, as I don't expect any conflicts.
>
> It's mainly a KVM thing and the MM changes are small and simple.
> I'd say that the KVM tree would be a better home?

Sure! I'll queue them on my side then.

Paolo


