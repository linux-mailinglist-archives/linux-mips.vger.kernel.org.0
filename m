Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23DF41959FC
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2020 16:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbgC0Pfh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Mar 2020 11:35:37 -0400
Received: from mx.0dd.nl ([5.2.79.48]:45748 "EHLO mx.0dd.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbgC0Pfh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 27 Mar 2020 11:35:37 -0400
X-Greylist: delayed 551 seconds by postgrey-1.27 at vger.kernel.org; Fri, 27 Mar 2020 11:35:37 EDT
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mx.0dd.nl (Postfix) with ESMTPS id D841C5FA7A;
        Fri, 27 Mar 2020 16:26:24 +0100 (CET)
Authentication-Results: mx.0dd.nl;
        dkim=pass (2048-bit key) header.d=vdorst.com header.i=@vdorst.com header.b="LPYaZdnm";
        dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.vdorst.com (Postfix) with ESMTPSA id 93324264132;
        Fri, 27 Mar 2020 16:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com 93324264132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
        s=default; t=1585322784;
        bh=qP412JT+PCF9mLO8iKv3H/7yXAaC2yO5I+vaxZd+8J0=;
        h=Date:From:To:Cc:Subject:From;
        b=LPYaZdnmediJkuczeV0KqBrVjFKPdpGKFwFVhKQBAcOyo8GegYruTVtJGHMIPh+qj
         z9z4e28OMSZSv9AYt4iCu+8mJvQMOK6B0lVQ6dchBPOzMElBdFL3qIXRtWEXuMzdUs
         Rl+1MRe2k26kwtSwHaDTtjILOowwORUamNDeLOQaUaY6tx8ThjLUb19MEgFfgPwX8P
         EmD9TGbhLFLWpIcPQM/Fb1auVMTtBYvW4VZLSuIraRHWEctVmB5nmWRjO26i3CHScl
         46scvuxGeifBhGHgDG0EYDNfblLYOrahG2C13hMhE7IlLkgbRR4csDY/dqn9XtDRmJ
         brRGSA3ZRzOcA==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Fri, 27 Mar 2020 15:26:24 +0000
Date:   Fri, 27 Mar 2020 15:26:24 +0000
Message-ID: <20200327152624.Horde.4Z2ZjKkOtsKUryuWp4S7pe-@www.vdorst.com>
From:   =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: MIPS: ralink: mt7621: introduce 'soc_device' initialization,
 compile issue
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sergio,

I am hitting this issue with the lastest linux-next:

/home/rene/dev/openwrt/staging_dir/toolchain-mipsel_24kc_gcc-8.3.0_musl/bin/mipsel-openwrt-linux-ld: arch/mips/ralink/mt7621.o: in function  
`soc_dev_init':
/home/rene/dev/net-next/arch/mips/ralink/mt7621.c:185: undefined  
reference to `soc_device_register'
make: *** [Makefile:1086: vmlinux] Error 1

Are you also experiencing this issue?

I don't see any other compiler issue.

Greats,

René



