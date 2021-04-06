Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20535355955
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 18:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346510AbhDFQjF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 12:39:05 -0400
Received: from alln-iport-8.cisco.com ([173.37.142.95]:18432 "EHLO
        alln-iport-8.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346499AbhDFQjC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Apr 2021 12:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=907; q=dns/txt; s=iport;
  t=1617727134; x=1618936734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Smn0mCx9dbvDRLHtP0dTWqRsaDRXRIB0PRh2q1rD0Lk=;
  b=Iot4pCl9rsClUU/6MKDnsHdvF+f5tVFlqD9zruuAyZV/f/WAP69x74Mz
   Axs7fgCnuoEVSSwNxLHR6QJeavuPnIS+YuuOpoQRACfZJLTK6MSeBgzPI
   1k2JiR9n8IMclcgZB3PPeMP3D6plKJnaY4P2Cr0c62p6hvtNs6TCPRYs8
   s=;
X-IronPort-AV: E=Sophos;i="5.82,310,1613433600"; 
   d="scan'208";a="690319628"
Received: from alln-core-7.cisco.com ([173.36.13.140])
  by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Apr 2021 16:38:52 +0000
Received: from zorba ([10.24.14.212])
        by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 136GcoPb001265
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 6 Apr 2021 16:38:51 GMT
Date:   Tue, 6 Apr 2021 09:38:49 -0700
From:   Daniel Walker <danielwa@cisco.com>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Will Deacon <will@kernel.org>, ob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, xe-linux-external@cisco.com,
        Ruslan Ruslichenko <rruslich@cisco.com>,
        Ruslan Bilovol <rbilovol@cisco.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] CMDLINE: powerpc: convert to generic builtin command
 line
Message-ID: <20210406163849.GT2469518@zorba>
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <e51a16e369f6a7dfae948c6de76061f3a061a375.1617126961.git.danielwa@cisco.com>
 <366fd8d3-09c9-8cae-3f10-046c4a643792@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <366fd8d3-09c9-8cae-3f10-046c4a643792@csgroup.eu>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.14.212, [10.24.14.212]
X-Outbound-Node: alln-core-7.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 02, 2021 at 07:34:19PM +0200, Christophe Leroy wrote:
> 
> 
> Le 30/03/2021 à 19:56, Daniel Walker a écrit :
> > This updates the powerpc code to use the CONFIG_GENERIC_CMDLINE
> > option.
> > 
> > This includes a scripted mass convert of the config files to use
> > the new generic cmdline. There is a bit of a trim effect here.
> > It would seems that some of the config haven't been trimmed in
> > a while.
> 
> Sorry, this patch is not acceptable as is, the default for powerpc is
> CMDLINE_FROM_BOOTLOADER, ie builtin-cmdline is taken if and only if none is
> provided by the bootloader.
> 
> As far as I understand, that disappear with this patch.

We've talked about it previously. Maybe your not understanding the precedent of
the command line options. I tried to explain that one before.

What problems do you think are caused if this patch is applied ?

Daniel
