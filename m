Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24F133DA26
	for <lists+linux-mips@lfdr.de>; Tue, 16 Mar 2021 18:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238059AbhCPRCq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Mar 2021 13:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237156AbhCPRCU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Mar 2021 13:02:20 -0400
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4522EC06174A;
        Tue, 16 Mar 2021 10:02:19 -0700 (PDT)
Received: from miraculix.mork.no ([IPv6:2a01:799:c9e:a108:162d:5d96:d792:df29])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 12GH2BPZ032267
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Tue, 16 Mar 2021 18:02:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1615914132; bh=vp/GA9v/KL3JbZxcyD1G+bDAmVCA+mobz6mk5cdWMDQ=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=aO80HNtEntVZG3jsr+2F1tJDI2mlfxFYrDf3ENv/LheAubO0YpileTFd8VyXaRyPh
         bb4Nsm0RRVy2VfeOSc7FcItoEAZaUU7QatRTZR36yBiTqmfu7vIVJubS8sJE8KEbyx
         YV7UUuAPznMEa+nTk1/88wCdWM9f2Y8P75vU0bSk=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94)
        (envelope-from <bjorn@mork.no>)
        id 1lMD58-001Iip-O9; Tue, 16 Mar 2021 18:02:10 +0100
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: vmlinux.lds.S: Fix appended dtb not properly aligned
Organization: m
References: <20210316154515.171543-1-paul@crapouillou.net>
Date:   Tue, 16 Mar 2021 18:02:10 +0100
In-Reply-To: <20210316154515.171543-1-paul@crapouillou.net> (Paul Cercueil's
        message of "Tue, 16 Mar 2021 15:45:15 +0000")
Message-ID: <87r1kfnib1.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.102.4 at canardo
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Paul Cercueil <paul@crapouillou.net> writes:

> Commit 6654111c893f ("MIPS: vmlinux.lds.S: align raw appended dtb to 8
> bytes") changed the alignment from STRUCT_ALIGNMENT bytes to 8 bytes.

Ouch.  That was not my intention.  I see that there was a mixup with my
initial patch. My last version used STRUCT_ALIGNMENT, but might have
been lost since I sent it only as an attachment during the discussion.

Sorry for not catching this.  And thanks for fixing.


Bj=C3=B8rn
