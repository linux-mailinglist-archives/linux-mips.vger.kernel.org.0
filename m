Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1CCCD4D52
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 07:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfJLFyt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 01:54:49 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25453 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbfJLFyt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Oct 2019 01:54:49 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570859669; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=Y76ct1mfQm+gDOsrT21k7qyXHKNKngAALnBxIDdOsKm4DT4iVNnv9G9e+eZ7TwwZ9iavijfIkJ88meIlcfaqLEkYEmA3gunZ3VKAWxfL5zXDQdpTKacH8GSUMb74m0DMLGZ+uIQhZ+wSuCWCMFYFWwWr0grZw0ksqCOo0dY9fww=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570859669; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=JDuVST2VkoELe/2fG86SHmz85muqhMXcSmVMfw/sb5w=; 
        b=baP9rOd/Xog7SKVOe4ZmkyEq5qKbRA9cgdVRki93HE/tRG3p+S98Ow3M1U3jE/ZHrYdQPmpKFCs+iIY/wFmU+aL69GNkWicit8CEDKueKJiYFJFLsQp6YVY/h/zgZnQVhzODw+/DWRfFPK+ckB7AzqHx9kRJsHP3AXqE0Lp7O/Y=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=t3F/21qWHx7tFz4TiIDtcBKT6bgE14jHVahb/9weBPum3exvgpPjfqed16YADKrh4H6ah+55qY5j
    gjS5VbNeXYgZUXbSES/DWU7VARxSBu5wQeliP8fd8NkBO8iJwp1F  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570859669;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=62;
        bh=JDuVST2VkoELe/2fG86SHmz85muqhMXcSmVMfw/sb5w=;
        b=byBCG3DmYd00DaaA1qfTdI7AGkDRBE63eWSg51FD/63MniTr5ZC/EWKGR4jkS0eZ
        EU7Jrj0hXG93VKDWCHUw7y3r+gNISnVnyD4Mub/I1YAMajiC29RKbpAJia1UpKiXIKf
        GTD7WcKuBMMxuKTUmIQ/jFvYwmP+CujOK/Pd2vIo=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1570859669265686.4608330592291; Fri, 11 Oct 2019 22:54:29 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jason@lakedaemon.net,
        paul.burton@mips.com, allison@lohutok.net, syq@debian.org,
        rfontana@redhat.com, tglx@linutronix.de, paul@crapouillou.net,
        maz@kernel.org
Subject: Add process for more than one irq at the same time v6
Date:   Sat, 12 Oct 2019 13:53:45 +0800
Message-Id: <1570859630-50942-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v5->v6: add my Signed-off-by for patches from Paul Cercueil.


