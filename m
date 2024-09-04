Return-Path: <linux-mips+bounces-5330-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 253FC96C1B5
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 17:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 581F81C202CA
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 15:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CA21DC19B;
	Wed,  4 Sep 2024 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5+mYHi0"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C538A1DCB0A
	for <linux-mips@vger.kernel.org>; Wed,  4 Sep 2024 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725462245; cv=none; b=q5UXoxzTlYtx+fo/2x6IXbvz9PKSCwMFAgRNmJY8cdeLC+a+IIQ7RrvaV8cfF5cN497sAsTZyp0gkqdr5zdZhpckmlbKVFcB5j9E5p9nVRqNNUeYo7nSkS8f2XLTIfeP6bSUXBZo6Lk0BZ2ONPFWKNsG/kHf9teptf2s0xH7FPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725462245; c=relaxed/simple;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPapEvBVAckmD664fShDIP4e4qLkWXoBmAWs2VrJa2/J6dI2fvVtrugwOXD/8RzS4jmg1pfPOt758lcmIboMu848OdC8GYc7jSY3jU0zefjMCYAQMJ/vVv9IL+MfDX6xD36jQJ5Cu65lKI2eJ5bO/eGXQ6ykeL8bjWVlygK5Ssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5+mYHi0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725462242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=S5+mYHi0gAnKAwUPBsKyHLd9TH6JqY4EyfcL9AcM//ZhWGFO6OY4M3ZkEG3FjCMZv+vWTy
	IFSlVB1xwZjlOTFkUdVN+ET6HFEO/WJ8TsZ8UOK1cSweNP7sRN4Ke/1c3KF49jhku/pnLd
	BCJzsoHRWsRLS8mwHOe6BshkLBiBo58=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-633-BCdAfi9BNyOJcJCcVTiTfA-1; Wed,
 04 Sep 2024 11:03:57 -0400
X-MC-Unique: BCdAfi9BNyOJcJCcVTiTfA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC6E219560BD;
	Wed,  4 Sep 2024 15:03:52 +0000 (UTC)
Received: from virtlab1023.lab.eng.rdu2.redhat.com (virtlab1023.lab.eng.rdu2.redhat.com [10.8.1.187])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C2A273000239;
	Wed,  4 Sep 2024 15:03:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chao Gao <chao.gao@intel.com>,
	Kai Huang <kai.huang@intel.com>,
	Farrah Chen <farrah.chen@intel.com>
Subject: Re: [PATCH v4 00/10] KVM: Register cpuhp/syscore callbacks when enabling virt
Date: Wed,  4 Sep 2024 11:03:44 -0400
Message-ID: <20240904150344.177870-1-pbonzini@redhat.com>
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Queued, thanks.

Paolo



