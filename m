Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22B5234D9C
	for <lists+linux-mips@lfdr.de>; Sat,  1 Aug 2020 00:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgGaWhg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 18:37:36 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44568 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgGaWhf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 31 Jul 2020 18:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1596235055; x=1627771055;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fHsR8J3pziaEpfOkReKOKQRI2dS7+dilXvqPZXOBDiY=;
  b=W1ywNMIgds/lZMvobXKq9v1xuxafr0iADsg6YQrnN4UqhWu08jdAz4kO
   hXbildqYQEmyfOw9IzeCLy2lobtKBJIhk2XefCuaK1xDyiZXioE6SL2Xe
   LvxtMqDtI+E24R6vB+/3jBSJs9DwnSyXqYUpQKMtrtvrlN3hJE0RT4vUs
   4wKec8qAQhgCmV3bqk/eV0rwWmjV7v1RLtKOIdTpV69cy9Rw0mjmCo95+
   BvbyHN7jdybfVLxMTSIIHUpuZLMuzRgzg7S//AYCQhAK4/Mm9dd1ITRyc
   prQ1+bc8hUWrNRLmHUvg0rc6ovahGtbpLBMspCqc0Bauu5Z2Z0m3F50mD
   Q==;
IronPort-SDR: Otymg+j1sUeEEQpY9/KcG36YZeZJm2Kwb8F8oyMt46CC4PM3ooell5LogIShi9T9bBP+AWOuK0
 kAPZ1II+Go5mA4y6TW/ScdBL/8sdDmyyYhkLLuPn8t7GoBisvP0AQgX4ROf9fwxKSl+pFjJy0p
 X2CjSXU403TPXRY1tr7o7LhzTYpN6uHUrdC8+jH0TqhPn8Y8kmFEHQ/0u7S5ET1flWxfyhjVcL
 BrYXcq1JN43Puv8ARFuq4JzD9RPMeO6uRyTNY2Yp3gK++MRwvXNZIopGruAqQ6ssJ2BFXcNwjB
 fdE=
X-IronPort-AV: E=Sophos;i="5.75,419,1589212800"; 
   d="scan'208";a="253222744"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Aug 2020 06:37:34 +0800
IronPort-SDR: PKwJ++/QC0vo0Km3Hi/Jot1WjxcDllCCSRuFKlaKwLmw8aAVPcYWznq2jt2WO49LcMGN72Na1z
 NXjiq7TblejAMf4LZse/dYQG8bSLclcWQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 15:25:02 -0700
IronPort-SDR: CSLz2CPsdh485JhDLhjonjinNdotBWlcP5lANoZ87IGqquVBi2AWaLuTuG3GjpHzwb/a2VduMc
 tDbHM1RmWxsg==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 15:37:35 -0700
Date:   Fri, 31 Jul 2020 23:37:29 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Lichao Liu <liulichao@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] MIPS: Grant pte read permission, even if vma only have
 VM_WRITE permission.
In-Reply-To: <c42085fa-43f7-c845-79d7-8b30eefb78da@loongson.cn>
Message-ID: <alpine.LFD.2.21.2007312312300.24175@redsun52.ssa.fujisawa.hgst.com>
References: <20200717095536.45011-1-liulichao@loongson.cn> <20200722093603.GA10090@alpha.franken.de> <c42085fa-43f7-c845-79d7-8b30eefb78da@loongson.cn>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 24 Jul 2020, Lichao Liu wrote:

> > IMHO it's exactly the point of RIXI enabled CPUs to support a
> > writeonly mapping even if most of other archs aren't able to
> > support it. So if there is no real good reason to change this,
> > I'm going to leave it this way.
[...]
> I think there are have two solutions to the problem:
> 1)modify fault_in_user_writeable(), 
>   must claim read permission when claiming write permission.
> 2)Grant pte read permission, even if vma only have VM_WRITE permission.
> 
> But not sure which one is more suitable.

 Well, the internal documentation is clear:

 * fault_in_user_writeable() - Fault in user address and verify RW access

so if it does only verify W rather than RW access, then it has to be fixed 
and verify both kinds of access at a time.  Presumably:

	mmap_read_lock(mm);
	ret = fixup_user_fault(current, mm, (unsigned long)uaddr, 0, NULL);
	if (!ret)
		ret = fixup_user_fault(current, mm, (unsigned long)uaddr,
				       FAULT_FLAG_WRITE, NULL);
        mmap_read_unlock(mm);

at the minimum or perhaps by expanding the interface of `fixup_user_fault' 
to also support FAULT_FLAG_RW so as to avoid the double call.

 As Thomas says silently expanding access permissions beyond what has been 
granted would be a security breach.

  Maciej
