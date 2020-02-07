Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 580F915614C
	for <lists+linux-mips@lfdr.de>; Fri,  7 Feb 2020 23:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbgBGWf3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Feb 2020 17:35:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57295 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727048AbgBGWf2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Feb 2020 17:35:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581114927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8BwOjosBD3aan9vZqA1/XtTiViONk3Y9UUF8NI7mgRo=;
        b=CNzMrAp2t/XbYnhlGTPEcX3kqBU20BSZ7NvTW7ANuCfz5/NU7xnQyyammZfzuiOCw6W4zG
        pfMhX6vkk0PYqzGU0nPU6tp3OgtUk04KFl9PoXLdAAnjPwnf0iAkkFwgQaWaSu4pAa3+77
        mWY0fL5vQ4UdtBIevg8QxjOoTCZNmQ4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-SKFXohasPxOGoi1QupMbrA-1; Fri, 07 Feb 2020 17:35:25 -0500
X-MC-Unique: SKFXohasPxOGoi1QupMbrA-1
Received: by mail-qk1-f198.google.com with SMTP id y6so477638qki.13
        for <linux-mips@vger.kernel.org>; Fri, 07 Feb 2020 14:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8BwOjosBD3aan9vZqA1/XtTiViONk3Y9UUF8NI7mgRo=;
        b=tfKLGxRYbyw8gTQ0SgdhtAVgMuT7z1RoveqsxT4ComArwYjex6gS8llVMTxt5Gvvuq
         mQSQNxgfUVkLutrVjZBuGGFi27SwbDEi79yBbZ7bZucLtmVCDefUmgIzPNSp4Qh7bGOv
         AiTE6HieB5/kHMCC6jaDVe/VXgf4y4IxRdYhPNm9vo/9zjUoUZiTvk6OMZ7f3lolTPqm
         RUrfNOQGUaojYuQ6RIZBzDAiFBWXfGuX1c0UyH/o3INTJ1POHP9ufnI3nC+QX9btPN3/
         Cv7O3pebaD3wN2dDQFqv/FB4th+vFoSPCbcRMHTYylI+zIf8umtMgusstD07xxEGPo5F
         69yA==
X-Gm-Message-State: APjAAAUbFvpWBj9We0lkckLYdx8kv7lbVxlQsQgerKRqE9ezgH36o6JL
        u7sRuNxcYa7p5D9pAyUR1WS9nsiZ/pXqt5Of6h4DqWQOxuXYwXUGC0K33F0aWFHI6r63t2brRUI
        RfMDsO8J9UkljL8zTuQr7cA==
X-Received: by 2002:aed:3e13:: with SMTP id l19mr560578qtf.103.1581114925266;
        Fri, 07 Feb 2020 14:35:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqyVTvI4slEe315nMe8hBROEAYdieeZun635Z6BLpraphf59wQM9cy4oqH/UIWzzvIngWXEG9g==
X-Received: by 2002:aed:3e13:: with SMTP id l19mr560554qtf.103.1581114925041;
        Fri, 07 Feb 2020 14:35:25 -0800 (PST)
Received: from xz-x1.redhat.com ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id u12sm2178736qtj.84.2020.02.07.14.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 14:35:24 -0800 (PST)
From:   Peter Xu <peterx@redhat.com>
To:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        linux-mips@vger.kernel.org, peterx@redhat.com,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: [PATCH RFC 1/4] KVM: Provide kvm_flush_remote_tlbs_common()
Date:   Fri,  7 Feb 2020 17:35:17 -0500
Message-Id: <20200207223520.735523-2-peterx@redhat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207223520.735523-1-peterx@redhat.com>
References: <20200207223520.735523-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It's exactly kvm_flush_remote_tlbs() now but a internal wrapper of the
common code path.  With this, an arch can then optionally select
CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL=y and will be able to use the
common flushing code.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6d5331b0d937..915df64125f9 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -798,6 +798,7 @@ int kvm_vcpu_yield_to(struct kvm_vcpu *target);
 void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool usermode_vcpu_not_eligible);
 
 void kvm_flush_remote_tlbs(struct kvm *kvm);
+void kvm_flush_remote_tlbs_common(struct kvm *kvm);
 void kvm_reload_remote_mmus(struct kvm *kvm);
 
 bool kvm_make_vcpus_request_mask(struct kvm *kvm, unsigned int req,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index eb3709d55139..9c7b39b7bb21 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -302,8 +302,7 @@ bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req)
 	return called;
 }
 
-#ifndef CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
-void kvm_flush_remote_tlbs(struct kvm *kvm)
+void kvm_flush_remote_tlbs_common(struct kvm *kvm)
 {
 	/*
 	 * Read tlbs_dirty before setting KVM_REQ_TLB_FLUSH in
@@ -327,6 +326,13 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
 		++kvm->stat.remote_tlb_flush;
 	cmpxchg(&kvm->tlbs_dirty, dirty_count, 0);
 }
+EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs_common);
+
+#ifndef CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL
+void kvm_flush_remote_tlbs(struct kvm *kvm)
+{
+	kvm_flush_remote_tlbs_common(kvm);
+}
 EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
 #endif
 
-- 
2.24.1

