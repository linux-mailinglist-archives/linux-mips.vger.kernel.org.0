Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F23207E28E8
	for <lists+linux-mips@lfdr.de>; Mon,  6 Nov 2023 16:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbjKFPn1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Nov 2023 10:43:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbjKFPn0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Nov 2023 10:43:26 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909EE13E
        for <linux-mips@vger.kernel.org>; Mon,  6 Nov 2023 07:43:23 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5afa071d100so94074127b3.1
        for <linux-mips@vger.kernel.org>; Mon, 06 Nov 2023 07:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699285403; x=1699890203; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ABS8rPoBy1ITQ62kUEvxWovIfmSWeQOAvNCpebOJLoI=;
        b=vzsyRpmAxCH/8GChvrGqDn1yvCAI0owjxSc6wm0w6nRGowEL6uQH0k86wM3BowHnWI
         YO+R/Q2MeQV7zL2YvlMRp+22CKQJHYviHQJiz0i65xCl7cDkcN92Hc+gP14ppMymRD2H
         aNKuUvrMcOB0Y4b701bftPjfVwD1nBdpNRCXnjvIWg7qEQYr6bnVR10Wr9ZRLz5WKfcL
         qITuyIHcTB0+pH6vcpcz51cGsP3HxdLI6QiqVZ5anzF+GCPejnwTJ6NV8yQuDbkP8EAc
         /QZSYZnij1meUOSvTcHCycSqLXFAA8JQQ7ufFnyiSnwYFLNV/kl6P7zkJFOHvY7xbPv8
         Os3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699285403; x=1699890203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABS8rPoBy1ITQ62kUEvxWovIfmSWeQOAvNCpebOJLoI=;
        b=EZK5CoDKT9ztsxnOI4XKoYOmbA3ofpIK9GpUraPa0yqmtsNLpbODf9ebhutlLphscM
         1eYULSjKpPQWMQ0ICWzSdsywoiUbgGkm5co4T/8jYLUQ9s0sZoU/y7iAn6v3DQQtnE0f
         UPReVrUHven7Kzf9Ny7TuqGLEgs3K6shCgIg6OMlvJTYAlRjw4DUSi5s/EBLsexboA8D
         prvIzy/za+GBlCApsJNUpH8yiNr6CnAcl2Mjotly7p77QAoOh10FKKL/t9AuScF0WIDG
         aowldY5WMCYxQLVlMujKPjDhu9MlTr8QGyBJ3163q2JLfpLo5rwVg88yf+f0xxCPBhz6
         hO9A==
X-Gm-Message-State: AOJu0YxVA2h97OEF/j1dniW5jBV5Vp82jLdznMjS4rN/rCaakS9YmoQE
        BXp+EOf4qhYAOk817BCGnJPRQrFiCDA=
X-Google-Smtp-Source: AGHT+IFZU6oilNAmMp5GLulg+dwoZ1zspXQbywwTDejvG8kP1K7yDCwH0QkLRrw/RyNVPmFev9uMuH6PQSU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ce94:0:b0:da0:3bea:cdc7 with SMTP id
 x142-20020a25ce94000000b00da03beacdc7mr527390ybe.2.1699285402751; Mon, 06 Nov
 2023 07:43:22 -0800 (PST)
Date:   Mon, 6 Nov 2023 07:43:07 -0800
In-Reply-To: <ZUYcb6no9ADYytrx@yilunxu-OptiPlex-7050>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUYcb6no9ADYytrx@yilunxu-OptiPlex-7050>
Message-ID: <ZUkJiwp8VHY0ICab@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From:   Sean Christopherson <seanjc@google.com>
To:     Xu Yilun <yilun.xu@linux.intel.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
        Xu Yilun <yilun.xu@intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        David Matlack <dmatlack@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        "=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Nov 04, 2023, Xu Yilun wrote:
> > +KVM_SET_USER_MEMORY_REGION2 is an extension to KVM_SET_USER_MEMORY_REGION that
> > +allows mapping guest_memfd memory into a guest.  All fields shared with
> > +KVM_SET_USER_MEMORY_REGION identically.  Userspace can set KVM_MEM_PRIVATE in
> > +flags to have KVM bind the memory region to a given guest_memfd range of
> > +[guest_memfd_offset, guest_memfd_offset + memory_size].  The target guest_memfd
>                                                         ^
> The range end should be exclusive, is it?

Yes, that should be a ')', not a ']'.

> > +static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
> > +{
> > +	const char *anon_name = "[kvm-gmem]";
> > +	struct kvm_gmem *gmem;
> > +	struct inode *inode;
> > +	struct file *file;
> > +	int fd, err;
> > +
> > +	fd = get_unused_fd_flags(0);
> > +	if (fd < 0)
> > +		return fd;
> > +
> > +	gmem = kzalloc(sizeof(*gmem), GFP_KERNEL);
> > +	if (!gmem) {
> > +		err = -ENOMEM;
> > +		goto err_fd;
> > +	}
> > +
> > +	/*
> > +	 * Use the so called "secure" variant, which creates a unique inode
> > +	 * instead of reusing a single inode.  Each guest_memfd instance needs
> > +	 * its own inode to track the size, flags, etc.
> > +	 */
> > +	file = anon_inode_getfile_secure(anon_name, &kvm_gmem_fops, gmem,
> > +					 O_RDWR, NULL);
> > +	if (IS_ERR(file)) {
> > +		err = PTR_ERR(file);
> > +		goto err_gmem;
> > +	}
> > +
> > +	file->f_flags |= O_LARGEFILE;
> > +
> > +	inode = file->f_inode;
> > +	WARN_ON(file->f_mapping != inode->i_mapping);
> 
> Just curious, why should we check the mapping fields which is garanteed in
> other subsystem?

Mostly to document the behavior.  The vast majority of folks that read this code
will be KVM developers, not file systems developers, and will likely have no clue
about the relationship between f_mapping and i_mapping.  And in the extremely
unlikely scenario that anon_inode_getfile_secure() no longer sets f_mapping, a
WARN detects the issue whereas a comment does not.
