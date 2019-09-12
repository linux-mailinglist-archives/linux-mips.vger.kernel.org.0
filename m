Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4540B1281
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2019 17:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbfILP64 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Sep 2019 11:58:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:49704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbfILP64 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Sep 2019 11:58:56 -0400
Received: from [10.227.109.174] (unknown [188.64.207.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5AB5520693;
        Thu, 12 Sep 2019 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568303935;
        bh=XmG5HhrRe25+w9qGzOcPfWBOm8I3sxDAkYcZ+NossLU=;
        h=Date:In-Reply-To:References:Subject:To:CC:From:From;
        b=lwJbIi+pOe1lg6lIPBOtRo9Ti4f0ui7OLWFViW2vSVw7QGLOag1AcF0nFSRTRA9GC
         VnV5k3C0d3o2rDn6Qj1o8nMsHQm0hcAGCMTP7OqI56B+zOHIp6WZ2GqBRVT6iXqZfv
         4uTNhdAVcVtLQKAteuw5lrXDL0j7qC0kn5n1b04Q=
Date:   Thu, 12 Sep 2019 16:58:45 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <20190912140912.GA13137@alpha.franken.de>
References: <20190905133251.GA3650@rapoport-lnx> <20190905154831.88b7853b47ba7db7bd7626bd@suse.de> <20190905154747.GB3650@rapoport-lnx> <20190905233800.0f6b3fb3722cde2f5a88663a@suse.de> <20190906130223.GA17704@rapoport-lnx> <20190909182242.c1ef9717d14b20212ef75954@suse.de> <20190910113243.GA19207@rapoport-lnx> <20190911160939.19f776535770d12ff51a2af7@suse.de> <20190912105831.GA10677@rapoport-lnx> <20190912155539.6151b0811e858455be4c8d86@suse.de> <20190912140912.GA13137@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
From:   Mike Rapoport <rppt@kernel.org>
Message-ID: <D0D37105-8A90-410F-B912-BA473A958C73@kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On September 12, 2019 3:09:12 PM GMT+01:00, Thomas Bogendoerfer <tsbogend@a=
lpha=2Efranken=2Ede> wrote:
>On Thu, Sep 12, 2019 at 03:55:39PM +0200, Thomas Bogendoerfer wrote:
>> - reserved[0xd]	[0x000000035bff8000-0x000000035bffffff],
>0x0000000000008000 bytes flags: 0x0
>>=20
>> I have no idea which reservation this is, but it's not from one of
>the
>> node data=2E
>
>that's sparsemem's mem_section=2E And=20
>
> free_bootmem_with_active_regions(node, end_pfn);
>
>on the last node will free this reserved memory, when memory
>is added node by node=2E This explains it=2E
>
>So when resending the patch add my
>
>Tested-by: Thomas Bogendoerfer <tbogendoerfer@suse=2Ede>

I was thinking about co-developed, can add both :)

>Thomas=2E


--=20
Sincerely yours,
Mike
