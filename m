Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835D92356ED
	for <lists+linux-mips@lfdr.de>; Sun,  2 Aug 2020 14:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgHBMnA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Aug 2020 08:43:00 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53493 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727914AbgHBMnA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 2 Aug 2020 08:43:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1596372179; x=1627908179;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2Ba0sZwTEXhN5rMnYW6AFPc3pmPqVORnSGuOR6AbUuI=;
  b=FmKZR6LM0SHAntEcgU1gwJq6Yww1rLW0U6Qp16DDtTlvUW3Pupc7umy1
   uDAdcCw4OXBhrcl+YA1E/erNs8/UkPTqILQZQU6YwLxjhDJhc479bjUH/
   mQNDcz+5rdjdKdght8ITuyxGRD/PADc1FwUe01Yk1X+r9w+sSmSwGoIqr
   MKgnOspOpmo1g4QgaUcMXCDqSeWqi2VXyAeKc2U0FRDAY1JjSk5Z3dW+G
   2kjN4DnmHtmTV2vum0ZAMZMAIqBm9RGIVaGwIPDxPmx1l1K+6iq7mStIT
   CANmg06L/YqRcQ0cHgX7JxbxrzVdQFoNLMhKeCwbtBUVM/vGB3y3y2W36
   A==;
IronPort-SDR: zz8DiT5V4B+jjq/WpgSqBToxu/XDOQk2JTMBWP+xzbiXiyVLxEZsQDLuiAexLODUF61C2NSxxl
 vPsmu/kXiFTAECAHjr48i+s1PYZjx9vyC265yMnzds+nEUK9b0qnMfjx8BQtihhp3dCBOX7bRX
 vD4Prx+7jf4DQYLmHdBTQgI9kY9mEy0JXMg2WvUEjNahM65/tH0SUh2P1CkEddAUVZzbyPfUm3
 nnF46Zy6k53+zizrMRjiIkFxMcdNoGVy5uSt6dvM+A3+5Xaur6UORPZCvdIHuBwdpfBxzNk8CA
 hNE=
X-IronPort-AV: E=Sophos;i="5.75,426,1589212800"; 
   d="scan'208";a="253293763"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Aug 2020 20:42:59 +0800
IronPort-SDR: 9p6TmkzxglvRTDTpzjFNzfDBQ2/mN63pPxpRxVMJeTXldRABGNSXOw/E+6eIRosQpQIre04eId
 8uAC0X/qVQ0A==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2020 05:31:02 -0700
IronPort-SDR: vCKJjUggEeJrcizyNn1jQEEb8EnrrmDjgAlxUjyCHJTuklGiuPukmrXAUrqyCDpeYKy07LZKrf
 MqBed3i3K7Kg==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2020 05:42:57 -0700
Date:   Sun, 2 Aug 2020 13:42:51 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Paul Cercueil <paul@crapouillou.net>
cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH v2 1/2] MAINTAINERS: Remove JZ4780 DMA driver entry
In-Reply-To: <DGFFEQ.RMDW72DK0U5B1@crapouillou.net>
Message-ID: <alpine.LFD.2.21.2008021339110.24175@redsun52.ssa.fujisawa.hgst.com>
References: <20200726155559.4650-1-krzk@kernel.org> <alpine.LFD.2.21.2008012327070.24175@redsun52.ssa.fujisawa.hgst.com> <DGFFEQ.RMDW72DK0U5B1@crapouillou.net>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 2 Aug 2020, Paul Cercueil wrote:

> >  FYI, the usual approach would be marking the entry "Orphan" rather 
> > than
> > removing it entirely, so that the mapping remains and makes it easy 
> > for
> > someone to pick it up.
> 
> This is OK in this case, as the driver is also listed as part of the 
> "INGENIC JZ47xx SoCs".

 Fair enough (and odd enough too to have two entries for one piece), 
though in this case I think the commit description ought to mention it.  
As it stands it makes one think the driver is not going to have a 
maintainer anymore: "[...] and no maintenance is provided."

  Maciej
