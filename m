Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18409138C7F
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 08:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgAMHsa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 02:48:30 -0500
Received: from mail01.vodafone.es ([217.130.24.71]:42524 "EHLO
        mail01.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbgAMHsa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jan 2020 02:48:30 -0500
IronPort-SDR: ww7OEtC+fh6NFRReFeD/7RzZtN+koz8XX5robM18PJS1sn4tqZq7LBsxAX2BT8x/vPQ31H0JbX
 ugRChdh7oZoQ==
IronPort-PHdr: =?us-ascii?q?9a23=3A+OqtdBHsXUn3efxWxw1SBp1GYnF86YWxBRYc79?=
 =?us-ascii?q?8ds5kLTJ7zrs+wAkXT6L1XgUPTWs2DsrQY0rGQ6f6xEjVZvd6oizMrSNR0TR?=
 =?us-ascii?q?gLiMEbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ?=
 =?us-ascii?q?/iOgVrO+/7BpDdj9it1+C15pbffxhEiCCybL9vIhi6txvdu8gSjIdtN6o91x?=
 =?us-ascii?q?TEqWZUdupLwm9lOUidlAvm6Meq+55j/SVQu/Y/+MNFTK73Yac2Q6FGATo/K2?=
 =?us-ascii?q?w669HluhfFTQuU+3sTSX4WnQZSAwjE9x71QJH8uTbnu+Vn2SmaOcr2Ta0oWT?=
 =?us-ascii?q?mn8qxmRgPkhDsBOjUk9m3bjdF+g75BrxKkpx1z2pDZYIaPNPpmeaPdZ8kVRX?=
 =?us-ascii?q?ZfUcpISSNBBJqwYpcTD+odJ+lXs4n9qEULrRSgAwmsGPrjxSFOhnPv2qM61O?=
 =?us-ascii?q?IhHh/G3QA5Ad0OtmnfoNH7OasOTey5ya/FxijBYfxLwzfw8IbGfBA7of+SXr?=
 =?us-ascii?q?x+bMXexlUgGQ7eklWdq5DqMy+J2ugRrWSW6fdrW+K1i24grgF8uiKhydkwio?=
 =?us-ascii?q?bXnIIe11DL9SJ/wIY6ONa1T1Z7bsC4EJROrSGbOYx2QsUtQ2xzuCY60aYJto?=
 =?us-ascii?q?KhcCcWz5QnwgTTa/yEc4WR5B/oSeWfIS9giX57Zb6yhQy+/VWux+HgTMW4zl?=
 =?us-ascii?q?lHojBLn9TMsH0Gygbd5dKdSvRn+0eswTOP1wfO5e5aOU00jq/bK4I5wr43i5?=
 =?us-ascii?q?oTrVzPHi/ol0Xyi6+bbkAk9fKp6+TjeLXpuJucO5N7hw3kLKQundGwDv42Mg?=
 =?us-ascii?q?gJWWiU5/6w26P4/UHhQbVKiOM5krXBvZzEOMgWpLS1DxJb34o/8RqzETir3M?=
 =?us-ascii?q?4WkHQHNF5FfQiIj4ntO1HAOvD4CvK/jky0kDh12/DJIKfhA5vKLnjFn7fsZr?=
 =?us-ascii?q?Z961VHxwUv19xQ+5VUCrQbLPLzWU/9rMbYAQMhMwyo3+bnD81w1ocfWWKJH6?=
 =?us-ascii?q?+YP7resVqJ5uI3OOmBf5EVuDnjJPg//fLujmE2mUUbfaa32Zsbcne4Hu5pIx?=
 =?us-ascii?q?bRXX25htYHDHdPuwsmV8T0h1CYFz1efXC/W+Q7/D5oMo++CZb/QdWVjaCMxm?=
 =?us-ascii?q?+EGZtZLjReB0yBC2jvcYqEWPcXYim6LcpokzhCXr+kHdwPzxar4Tf317d9Zt?=
 =?us-ascii?q?XT/CJQ4YruyNVv+OrVmjky7jZ/Sc+a1ieNTDcnzSszWzYq0fUm8gRGwVCZ3P?=
 =?us-ascii?q?0j26RV?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EGEgBqIBxeeiMYgtkUBjMYGgEBAQE?=
 =?us-ascii?q?BAQEBAQMBAQEBEQEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4E?=
 =?us-ascii?q?Agx4VhggTDIFbDQEBAQEBGxoCAQGEQE4BF4ESJDoEDQIDDQEBBQEBAQEBBQQ?=
 =?us-ascii?q?BAQIQAQEJDQsEK4VKgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVOFTwE?=
 =?us-ascii?q?BM4UolzUBhASJAA0NAoUdgkUECoEJgRojgTYBjBgagUE/gSMhgisIAYIBgn8?=
 =?us-ascii?q?BEgFsgkiCWQSNQhIhgQeIKZgXgkEEdolMjAKCNwEPiAGEMQMQgkUPgQmIA4R?=
 =?us-ascii?q?OgX2jN1eBDA16cTMagiYagSBPGA2WSECBFhACT4kugjIBAQ?=
X-IPAS-Result: =?us-ascii?q?A2EGEgBqIBxeeiMYgtkUBjMYGgEBAQEBAQEBAQMBAQEBE?=
 =?us-ascii?q?QEBAQICAQEBAYF7AgEBFwEBgS6BTVIgEpNQgU0fg0OLY4EAgx4VhggTDIFbD?=
 =?us-ascii?q?QEBAQEBGxoCAQGEQE4BF4ESJDoEDQIDDQEBBQEBAQEBBQQBAQIQAQEJDQsEK?=
 =?us-ascii?q?4VKgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVOFTwEBM4UolzUBhASJA?=
 =?us-ascii?q?A0NAoUdgkUECoEJgRojgTYBjBgagUE/gSMhgisIAYIBgn8BEgFsgkiCWQSNQ?=
 =?us-ascii?q?hIhgQeIKZgXgkEEdolMjAKCNwEPiAGEMQMQgkUPgQmIA4ROgX2jN1eBDA16c?=
 =?us-ascii?q?TMagiYagSBPGA2WSECBFhACT4kugjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.69,428,1571695200"; 
   d="scan'208";a="304668737"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail01.vodafone.es with ESMTP; 13 Jan 2020 08:48:27 +0100
Received: (qmail 24375 invoked from network); 12 Jan 2020 05:00:21 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-mips@vger.kernel.org>; 12 Jan 2020 05:00:21 -0000
Date:   Sun, 12 Jan 2020 06:00:19 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     linux-mips@vger.kernel.org
Message-ID: <13041657.460779.1578805220858.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

