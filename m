Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB2642D5F8
	for <lists+linux-mips@lfdr.de>; Thu, 14 Oct 2021 11:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhJNJ2g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Oct 2021 05:28:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20564 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230026AbhJNJ2f (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 Oct 2021 05:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634203590;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MFy26Kc6cpLu18LAs5Mx0Nrg8iL3DuTgZC2Ev14vjlo=;
        b=X2mCdv8b1K88eBKlnWLq69ctpJUgvxcadvamxM/mn99+T+jMO3aioYuoqC+npqMg6NSXb9
        DjbnOYauRoO0F+uJ1Fd4TTsFKj80Qh9YoDcsBGmIU0Z53054RrYn3NRQVR6ZKRRpPpdlZw
        t/YBQ7/WS+kpUFDtv2YGdeKj9M2YW4E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-mxiI0tPaPr2_Xf3gdutgqA-1; Thu, 14 Oct 2021 05:26:29 -0400
X-MC-Unique: mxiI0tPaPr2_Xf3gdutgqA-1
Received: by mail-ed1-f72.google.com with SMTP id d3-20020a056402516300b003db863a248eso4629719ede.16
        for <linux-mips@vger.kernel.org>; Thu, 14 Oct 2021 02:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MFy26Kc6cpLu18LAs5Mx0Nrg8iL3DuTgZC2Ev14vjlo=;
        b=ocPIiXbOUw8h2kGHu0D4Rr2gLYe+fwWMa7Av2HL5meHegJo1reb4rDb/95t+YW6lC+
         fDcpYhN6n7pOZAxec9vgufaNlsPLpoSwt5HVm+RBdnrtwprKQQeYWMIOzE5Esv8/qzM0
         D+2t6P6yhxnyq/gWk0bonXiaQPZNhFjlKOBLAzT9V5uC9G4Ng4bYZFxCdg/qYvKR7tB+
         D2FEI4elIUHdxhTvt/FvBipkNXmFyow+DYINd7mxb2it3GU01MwD/DdzVLtvjKJZPEOF
         hwo2h4J47yEO8VGnm5vUgXBx93Nu4O3viLCQx1ZKxL4aQp318Ujem/wf6hQk57c2D4G9
         gQCw==
X-Gm-Message-State: AOAM531Yn1+ZGYumTAnAs8OMnncmqjExRAK08KBDl9YL86dNJjslZ+wV
        LgVjRSzo318mVao25xTyzIUY+GKUfngFOXqexTNb64NOs6nR1XDex9H9Ab/bVbXtG0JK9wVaXX1
        9QwmqaSKLxbHQRyIqIUCNUQ==
X-Received: by 2002:a05:6402:3488:: with SMTP id v8mr6898735edc.106.1634203588051;
        Thu, 14 Oct 2021 02:26:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzUMhY55dY1Ed2tUolHVxn0GGtah89ijl+mJABjkbp/N7HKf5Fl2EAkvFydJiTJ/Wm+2qndQ==
X-Received: by 2002:a05:6402:3488:: with SMTP id v8mr6898699edc.106.1634203587836;
        Thu, 14 Oct 2021 02:26:27 -0700 (PDT)
Received: from redhat.com ([2.55.16.227])
        by smtp.gmail.com with ESMTPSA id f19sm1749252edj.77.2021.10.14.02.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 02:26:27 -0700 (PDT)
Date:   Thu, 14 Oct 2021 05:26:20 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     "Reshetova, Elena" <elena.reshetova@intel.com>
Cc:     Andi Kleen <ak@linux.intel.com>,
        "Williams, Dan J" <dan.j.williams@intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "Lutomirski, Andy" <luto@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Richard Henderson <rth@twiddle.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        James E J Bottomley <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter H Anvin <hpa@zytor.com>,
        "Hansen, Dave" <dave.hansen@intel.com>,
        "Luck, Tony" <tony.luck@intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Message-ID: <20211014052605-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
 <DM8PR11MB57501C8F8F5C8B315726882EE7B69@DM8PR11MB5750.namprd11.prod.outlook.com>
 <20211012171016-mutt-send-email-mst@kernel.org>
 <DM8PR11MB5750A40FAA6AFF6A29CF70DAE7B89@DM8PR11MB5750.namprd11.prod.outlook.com>
 <20211014025514-mutt-send-email-mst@kernel.org>
 <DM8PR11MB57500B2D821E8AAF93EB66CEE7B89@DM8PR11MB5750.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB57500B2D821E8AAF93EB66CEE7B89@DM8PR11MB5750.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 14, 2021 at 07:27:42AM +0000, Reshetova, Elena wrote:
> > On Thu, Oct 14, 2021 at 06:32:32AM +0000, Reshetova, Elena wrote:
> > > > On Tue, Oct 12, 2021 at 06:36:16PM +0000, Reshetova, Elena wrote:
> > > > > > The 5.15 tree has something like ~2.4k IO accesses (including MMIO and
> > > > > > others) in init functions that also register drivers (thanks Elena for
> > > > > > the number)
> > > > >
> > > > > To provide more numbers on this. What I can see so far from a smatch-based
> > > > > analysis, we have 409 __init style functions (.probe & builtin/module_
> > > > > _platform_driver_probe excluded) for 5.15 with allyesconfig.
> > > >
> > > > I don't think we care about allyesconfig at all though.
> > > > Just don't do that.
> > > > How about allmodconfig? This is closer to what distros actually do.
> > >
> > > It does not make any difference really for the content of the /drivers/*:
> > > gives 408 __init style functions doing IO (.probe & builtin/module_
> > > > > _platform_driver_probe excluded) for 5.15 with allmodconfig:
> > >
> > > ['doc200x_ident_chip',
> > > 'doc_probe', 'doc2001_init', 'mtd_speedtest_init',
> > > 'mtd_nandbiterrs_init', 'mtd_oobtest_init', 'mtd_pagetest_init',
> > > 'tort_init', 'mtd_subpagetest_init', 'fixup_pmc551',
> > > 'doc_set_driver_info', 'init_amd76xrom', 'init_l440gx',
> > > 'init_sc520cdp', 'init_ichxrom', 'init_ck804xrom', 'init_esb2rom',
> > > 'probe_acpi_namespace_devices', 'amd_iommu_init_pci', 'state_next',
> > > 'arm_v7s_do_selftests', 'arm_lpae_run_tests', 'init_iommu_one',
> > 
> > Um. ARM? Which architecture is this build for?
> 
> The list of smatch IO findings is built for x86, but the smatch cross function
> database covers all archs, so when queried for all potential function callers,
> it would show non x86 arch call chains also. 
> 
> Here is the original x86 finding and call chain for the 'arm_v7s_do_selftests':
> 
>   Detected low-level IO from arm_v7s_do_selftests in fun
> __iommu_queue_command_sync
> 
> drivers/iommu/amd/iommu.c:1025 __iommu_queue_command_sync() error:
> {15002074744551330002}
>     'check_host_input' read from the host using function 'readl' to a
> member of the structure 'iommu->cmd_buf_head';
> 
> __iommu_queue_command_sync()
>   iommu_completion_wait()
>     amd_iommu_domain_flush_complete()
>       iommu_v1_map_page()
>         arm_v7s_do_selftests()
> 
> So, the results can be further filtered if you want a specified arch. 

So what is it just for x86? Could you tell?

-- 
MST

