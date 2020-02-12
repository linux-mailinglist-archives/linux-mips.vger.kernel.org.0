Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60EDC15AA18
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2020 14:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgBLNdB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Feb 2020 08:33:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60750 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727698AbgBLNdB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Feb 2020 08:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581514381;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e4bOQL/UoLkr49ZKqo0O/BFOCGX6CyzTc0e1NCwjejI=;
        b=MjM8WkGL4NEySplijAg9DJXyBLoUFgTqhfM4fD5q670pAtRBbQtJgtWyzcDYmsugb/nV4e
        tyDrpTW1ug1/Nt4CL/7CfQUtwYlYiGylfT/xNCcYBHliSc/rPKK0g/mzSKZpFJgnBK/br6
        wOyKv27DDFQr/NrThpFnJsvAwd7e/Yg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-HCgvpZUUM8azGFJGMF-Nmg-1; Wed, 12 Feb 2020 08:32:59 -0500
X-MC-Unique: HCgvpZUUM8azGFJGMF-Nmg-1
Received: by mail-wm1-f72.google.com with SMTP id 7so714291wmf.9
        for <linux-mips@vger.kernel.org>; Wed, 12 Feb 2020 05:32:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e4bOQL/UoLkr49ZKqo0O/BFOCGX6CyzTc0e1NCwjejI=;
        b=qpWBjDcezkVGKDKmTYLMh/+0mZM1ryRFLQF+IO7l/c2RwTcs68Kx5Rp0KcYbq04J2j
         BbpkQiFNjmLUeqDAp3MtfWJJfLyK+nsQdebFJ1q/blZewjTxgCugCwkd4A0tk0hhRwA9
         zW5TVs7OAhKIyq3bBwhaWlChh0t9CU85Bag32hoKJZV5MWAbWriMNevJbFX+nFH4Yc6K
         9Bkm/OxCbLOdjGYAAzDnpxrT6mIyOASILvpRM3hRKj8GczyS1Cp2o6AvxlxyLsZcHu2P
         HDKVZW2t+LxNN3SlMxBA2+WfrgnTQVVObdPHUH726iGDOmnJ5JNFYNCT7qrtC04l4Tyf
         lQ+Q==
X-Gm-Message-State: APjAAAXDLrDTMgYWH/ngqWEyqJ6oWbV5JmoK48+qCD6WiTp6N+wzYrcZ
        HXMtQTpWR4ElJBmlnNGvOHXLUNiVbw5pMpciLYaiF+PcnEwRmvEt6QLxmdRLTk9q041LfjBXCpm
        aUoy2+eWebeJmUo1k4HpEXA==
X-Received: by 2002:a1c:a382:: with SMTP id m124mr12809069wme.90.1581514378071;
        Wed, 12 Feb 2020 05:32:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqxAiJj4wSVeSVUkZduqtNVDQSCnCIY2kaA/PLl2NFBnzNHI2iwUhcPTT8a9mdJu8hwpEpD2/Q==
X-Received: by 2002:a1c:a382:: with SMTP id m124mr12809048wme.90.1581514377743;
        Wed, 12 Feb 2020 05:32:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:652c:29a6:517b:66d9? ([2001:b07:6468:f312:652c:29a6:517b:66d9])
        by smtp.gmail.com with ESMTPSA id a198sm768814wme.12.2020.02.12.05.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2020 05:32:56 -0800 (PST)
Subject: Re: [PATCH RFC 1/4] KVM: Provide kvm_flush_remote_tlbs_common()
To:     Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        linux-mips@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>
References: <20200207223520.735523-1-peterx@redhat.com>
 <20200207223520.735523-2-peterx@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c83a9193-d91b-0f64-d0c9-40b2bad86bdc@redhat.com>
Date:   Wed, 12 Feb 2020 14:33:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200207223520.735523-2-peterx@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07/02/20 23:35, Peter Xu wrote:
> It's exactly kvm_flush_remote_tlbs() now but a internal wrapper of the
> common code path.  With this, an arch can then optionally select
> CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL=y and will be able to use the
> common flushing code.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Slightly more efficient, making it an inline function:

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e89eb67356cb..f92180eeffc6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -802,9 +802,18 @@ int kvm_vcpu_write_guest(struct kvm_vcpu *vcpu, gpa_t gpa, const void *data,
 int kvm_vcpu_yield_to(struct kvm_vcpu *target);
 void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool usermode_vcpu_not_eligible);
 
-void kvm_flush_remote_tlbs(struct kvm *kvm);
+void kvm_flush_remote_tlbs_common(struct kvm *kvm);
 void kvm_reload_remote_mmus(struct kvm *kvm);
 
+#ifdef CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
+void kvm_flush_remote_tlbs(struct kvm *kvm);
+#else
+static inline void kvm_flush_remote_tlbs(struct kvm *kvm)
+{
+	kvm_flush_remote_tlbs_common(kvm);
+}
+#endif
+
 bool kvm_make_vcpus_request_mask(struct kvm *kvm, unsigned int req,
 				 unsigned long *vcpu_bitmap, cpumask_var_t tmp);
 bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 70f03ce0e5c1..027259af883e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -303,8 +303,7 @@ bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req)
 	return called;
 }
 
-#ifndef CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
-void kvm_flush_remote_tlbs(struct kvm *kvm)
+void kvm_flush_remote_tlbs_common(struct kvm *kvm)
 {
 	/*
 	 * Read tlbs_dirty before setting KVM_REQ_TLB_FLUSH in
@@ -328,8 +327,7 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
 		++kvm->stat.remote_tlb_flush;
 	cmpxchg(&kvm->tlbs_dirty, dirty_count, 0);
 }
-EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
-#endif
+EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs_common);
 
 void kvm_reload_remote_mmus(struct kvm *kvm)
 {

