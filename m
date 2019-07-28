Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40C9B780AB
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2019 19:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfG1RfA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Jul 2019 13:35:00 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25529 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfG1RfA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Jul 2019 13:35:00 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564335289; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=FkkEcpJMTmydDx2O2mE7TXkW7mjkMPKwGHl7ASueQGkdg2J7SDhIuzmK73NOGZblhP3z47fC4uPK4DqaBgBAJcyK8ovHKbtX4BQ4PSNjZBc2d1+t8UxQAY5kw4LNzkUORIiOKp8aFDoTV50cSeAZaARzsJwmhCpfP4MmUTrfTWg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564335289; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=G6oQedkI8J0YrP2JXslPEck2U7srvknFaEmDIBRZKdE=; 
        b=onE3tNhCMnEcbFwsxqJMAdb32lbjYmqhcDtjpbWsmzzGAeQhZ+A9O3FLaxMmwtr5C2ECWfmNe4tZmQmIzM+y8xGhRyWZG025IOEBbzJfJnEHD/hvSBxESRYo7jn6bqmbR9pImk8OFEMAuH1Zb87Q7ZqSXpSRQ/o+LjZwXUsSifA=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=iebehV1jM85MXTDn4KFFK2phE8K5R/jxbi2eI5cD2eWnBGmJeiEoqISpzyorVnZzTN5lDcOI8/SO
    69uyO7bz7Nzq6IJp3OW2pUxFKfBVxNrVQXQ290UZlw2dkxmRtBDj  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564335289;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=230;
        bh=G6oQedkI8J0YrP2JXslPEck2U7srvknFaEmDIBRZKdE=;
        b=VvKIDMFBhNgTJCT0vdrNoc1qbrAJyzYfBq8k63O8wxg47yQGLd8Xm0i9yDACn5SV
        syF+OR0DxnC/+v29Ib6DYIivGyArqlgFDpoKh0OnIiHNVvFs1SChnPa12BBiHWARFuS
        530RBO5V61iAZ+qfbDXuU2OSkxE3Pciw1Oj+qglg=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 1564335287626688.0546299602289; Sun, 28 Jul 2019 10:34:47 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, tglx@linutronix.de,
        mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
Subject: Add Ingenic JZ4760 and X1000 and X1500 irqchip support v4.
Date:   Mon, 29 Jul 2019 01:34:29 +0800
Message-Id: <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2: Replace "__fls(pending)" with "bit" in function "generic_handle_irq".
v2->v3: Add support for probing irq-ingenic driver on JZ4760 and X1500 Soc.
v3->v4: Combined with patches 5 and 7, combined with patches 4, 6 and 8.


