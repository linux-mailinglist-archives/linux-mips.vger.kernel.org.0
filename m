Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76E6E352D2B
	for <lists+linux-mips@lfdr.de>; Fri,  2 Apr 2021 18:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235535AbhDBP6M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Apr 2021 11:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235304AbhDBP6M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Apr 2021 11:58:12 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA15C0613E6;
        Fri,  2 Apr 2021 08:58:10 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id v11so5098183wro.7;
        Fri, 02 Apr 2021 08:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S0QE5Nife2NIX13JY3vSkhHVDcNV6ya5TJk20SNgM60=;
        b=NC+pT0qgC9xQpmNaSTJsqEc39jCvteZfOcGp7rQ8n19dtPtGdd30thQtLIPM5zqE74
         tqh9aqT/1FDmBkauXsR1FiRphQ/jL6Qq8T74rCSJgDAEYvnkvWr0QJ/uIPVYEoPh1ykT
         E8Jrm6YjqW/7qPJ6kvrWfoeihZzpLEENP4W3MYJgHwKHALs9PY1d5t+b/joXrF8KzBgn
         +VqgT1AE1Y72XP2vwQ40S9W8h6a20LU1ST9qcY5+AMvOhIiOLPw0w0LxkLG1b6GueSDX
         NQIMWBSxeG2Q4sYNMMNKM/h3s5f9V4fCowB0tghpxfohDglC36GsrtkvlydeL2HEzMZk
         g7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=S0QE5Nife2NIX13JY3vSkhHVDcNV6ya5TJk20SNgM60=;
        b=IbjS3MPudPV3vKsz9g7OBkL6twqWTb01INRcZUjSBHVmBgi1D8pJ6wVjgSKw+J/0fO
         jOPYfYvUx2vKzPfhZZ/V8uNPkId+YTPB5pWs3DmKUsOifd2icfIatysbW+tvM5rHvPuw
         FFoV4YZ1cLIfo2DNlwgpKBLvsXh2fIEB052VDVAOOS821Lq13V3BN+zME9Sx5gYkjBqH
         gSQrGca8QO6ep9BS0rjHsEy9Zdu6aCMMaUOxnDOHBdbwIv/jattu1wOy6cx7uRkt5QAz
         o/izq+GzLimhqkJrdeaYZBYX7KchXFrLHK+t71s9/R7JScwFjKBOsxz+/V2vk17C6+2I
         qO/w==
X-Gm-Message-State: AOAM532gYF1dzG9D6Dare2OMwQt7hbZ8q44wTvBFT3fybBgV7R98VlXd
        Xt6BahwOEe3MBYxJSKZytlNZA6SXxBQ=
X-Google-Smtp-Source: ABdhPJwNkDphDY/S8Bx896Z9h9IrXl46gV4kgtBZUbxfi2p8nYXB6gnA9bVu/jBYmNF4nAZvBgVXgw==
X-Received: by 2002:adf:8562:: with SMTP id 89mr16125989wrh.101.1617379089568;
        Fri, 02 Apr 2021 08:58:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id w11sm2293625wmb.35.2021.04.02.08.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 08:58:09 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
To:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc:     chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com,
        seanjc@google.com, linux-mips@vger.kernel.org
Subject: [PATCH 0/4] KVM: MIPS: cleanup TLB flushing callbacks
Date:   Fri,  2 Apr 2021 17:58:03 +0200
Message-Id: <20210402155807.49976-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This series cleans up the flush_shadow_all and flush_shadow_memslot
callbacks, turning them into a single function that can be called from
kvm_arch_flush_remote_tlb.  This lets MIPS use the generic TLB flushing
code in the MMU notifiers.  With the upcoming refactoring of generic
MMU notifier code, without this patch MIPS would not be able to
coalesce TLB flushes anymore across multiple memslots.

Patch 1 is an unrelated cleanup that is needed for the rest to compile
(due to a call to kvm_arch_flush_remote_tlbs_memslot with a const
argument).

Paolo

Paolo Bonzini (4):
  KVM: constify kvm_arch_flush_remote_tlbs_memslot
  KVM: MIPS: rework flush_shadow_* callbacks into one that prepares the
    flush
  KVM: MIPS: let generic code call prepare_flush_shadow
  KVM: MIPS: defer flush to generic MMU notifier code

 arch/arm64/kvm/arm.c             |  2 +-
 arch/mips/include/asm/kvm_host.h | 12 ++++--------
 arch/mips/kvm/mips.c             | 21 +++++++++++----------
 arch/mips/kvm/mmu.c              | 12 ++----------
 arch/mips/kvm/trap_emul.c        | 13 ++-----------
 arch/mips/kvm/vz.c               | 19 ++++---------------
 arch/x86/kvm/mmu/mmu.c           |  2 +-
 include/linux/kvm_host.h         |  2 +-
 8 files changed, 26 insertions(+), 57 deletions(-)

-- 
2.30.1

