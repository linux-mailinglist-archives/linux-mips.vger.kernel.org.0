Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC0DC617EDB
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 15:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiKCOFa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Nov 2022 10:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiKCOFa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Nov 2022 10:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26EA5101FA
        for <linux-mips@vger.kernel.org>; Thu,  3 Nov 2022 07:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667484271;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2ld7KbWWPpVg/DGXuI3WKVRs5TJPSNq4PfcjQdMphjo=;
        b=EeNrDlWAb0Bc7nzeaVtG+PuDPQ9VQxc66qrQwDpAVQnilXHOtaiuALZHBPGB7fjzccPRE0
        vc7NaFPnok2UBlTK8nn1Kor3YpXFvUkD2Ho7nOXS8GZxdCYwpOrVh6+Gw47GktArRFpOm3
        dnnxmJ+Emi9JpGhtuguFYpVmsdRO9gY=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-567-kwoHGsX0OEymR7dxTVOC4Q-1; Thu, 03 Nov 2022 10:04:30 -0400
X-MC-Unique: kwoHGsX0OEymR7dxTVOC4Q-1
Received: by mail-vs1-f72.google.com with SMTP id q185-20020a6743c2000000b003a6ee1e0c90so1047663vsa.17
        for <linux-mips@vger.kernel.org>; Thu, 03 Nov 2022 07:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ld7KbWWPpVg/DGXuI3WKVRs5TJPSNq4PfcjQdMphjo=;
        b=7+lZGpTVUXOB/FuWnbtVOv5Cx8ifbMaEFf3tsl+8RZx4ADOSYwPUexq3y7JBnr7erg
         yHpw+FGLW5yLpTmX3+peMZhspaCjLfdrkp9lE/TdABiJuRZkrzRfgN558SJklEXQ0bvJ
         Kq/ARy1djeKaNbK240o8RRYJhphymOcfE8w7ETSjoML8izGH/NKztofZ1W5TZTcZ/2w0
         VhEoWJKxaP2qtj38nn8tGj7RzUqDRHFnuMoe9PwYdphy1zw66isncXSKghp5qxFELkEm
         2eLygMzi+bH0aCqSIaJwSc4KCqZ0Q64lb0oP7Ro1pdB5inwYG+QdTxlFkdrmC911G0Ja
         Uz7g==
X-Gm-Message-State: ACrzQf2paxzKe8iGwzJlwofx8KxHaSm2ezrPQZ22ycTEi4abxtO3a1Dm
        oF6FkDQT99PTXPHrw8OBrn7lkID/RIGIgL5C1bCFeVXYY1vyftQHofl58B8Y15kQukwfOFbUi/S
        oALRnmbrdpHE875W9JV4jNnlw89iwGgmydZtxtQ==
X-Received: by 2002:a67:c997:0:b0:3aa:1d0c:6bc7 with SMTP id y23-20020a67c997000000b003aa1d0c6bc7mr18114524vsk.16.1667484269585;
        Thu, 03 Nov 2022 07:04:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM57ejOKzdNWqeTyWHPkPRmEBqAcfUgljrJu10jVJC1iEGC5QqKTnJr+aHwKv6/RTPPoYaQADtoBOTHZ/wIpPrc=
X-Received: by 2002:a67:c997:0:b0:3aa:1d0c:6bc7 with SMTP id
 y23-20020a67c997000000b003aa1d0c6bc7mr18114480vsk.16.1667484269311; Thu, 03
 Nov 2022 07:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com> <20221102231911.3107438-11-seanjc@google.com>
 <d641088f-87d9-da77-7e98-92d1a9de6493@redhat.com>
In-Reply-To: <d641088f-87d9-da77-7e98-92d1a9de6493@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Date:   Thu, 3 Nov 2022 15:04:17 +0100
Message-ID: <CABgObfZDngVgmPetJEQGFW-MZGqYvW9tTa5jzcKheO5EO703Vw@mail.gmail.com>
Subject: Re: [PATCH 10/44] KVM: VMX: Clean up eVMCS enabling if KVM
 initialization fails
To:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Atish Patra <atishp@atishpatra.org>,
        David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Chao Gao <chao.gao@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Yuan Yao <yuan.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 3, 2022 at 3:01 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/3/22 00:18, Sean Christopherson wrote:
> > +static void hv_cleanup_evmcs(void)
>
> This needs to be __init.

Error: brain temporarily disconnected.

Paolo

